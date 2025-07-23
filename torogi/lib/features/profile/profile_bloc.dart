import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/data/repositories/profile_repository.dart';
import 'package:torogi/data/repositories/auth_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../core/utils/snackbar_util.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;
  final AuthRepository _authRepository = AuthRepository();

  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      debugPrint('Loading profile for userId: ${event.userId}');
      emit(ProfileLoading());
      try {
        final user = await repository.fetchUserProfile(event.userId);
        final blogs = await repository.fetchUserBlogs(event.userId);
        final currentUserId = Supabase.instance.client.auth.currentUser?.id;
        final isFollowing = currentUserId != null
            ? await repository.checkIfFollowing(currentUserId, event.userId)
            : false;

        emit(ProfileLoaded(user: user, blogs: blogs, isFollowing: isFollowing));
      } catch (e) {
        debugPrint('LoadProfile error: ${e.toString()}');
        emit(ProfileError('Failed to load profile: ${e.toString()}'));
      }
    });

    on<UpdateProfile>((event, emit) async {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        try {
          emit(ProfileLoading());

          await repository.updateProfile(
            userId: event.userId,
            name: event.name,
            bio: event.bio,
            location: event.location,
            banner: event.banner,
            userType: event.userType,
          );

          final updatedUser = await repository.fetchUserProfile(event.userId);
          final blogs = await repository.fetchUserBlogs(event.userId);

          emit(ProfileLoaded(
            user: updatedUser,
            blogs: blogs,
            isFollowing: currentState.isFollowing,
          ));
        } catch (e) {
          debugPrint('UpdateProfile error: ${e.toString()}');
          emit(ProfileError('Failed to update profile: ${e.toString()}'));
          emit(currentState);
        }
      }
    });

    on<UpdateProfilePicture>((event, emit) async {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        try {
          emit(ProfileLoading());

          await repository.uploadProfilePicture(event.userId, event.imageFile);

          final updatedUser = await repository.fetchUserProfile(event.userId);
          final blogs = await repository.fetchUserBlogs(event.userId);

          emit(ProfileLoaded(
            user: updatedUser,
            blogs: blogs,
            isFollowing: currentState.isFollowing,
          ));
        } catch (e) {
          debugPrint('UpdateProfilePicture error: ${e.toString()}');
          emit(ProfileError('Failed to update profile picture: ${e.toString()}'));
          emit(currentState);
        }
      }
    });

    on<ToggleFollow>((event, emit) async {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        try {
          final wasFollowing = currentState.isFollowing;

          if (wasFollowing) {
            await repository.unfollowUser(event.currentUserId, event.profileUserId);
          } else {
            await repository.followUser(event.currentUserId, event.profileUserId);
          }

          final currentUserProfile = await repository.fetchUserProfile(event.currentUserId);
          final otherUserProfile = await repository.fetchUserProfile(event.profileUserId);

          if (event.profileUserId == currentState.user['id']) {
            emit(ProfileLoaded(
              user: otherUserProfile,
              blogs: currentState.blogs,
              isFollowing: !wasFollowing,
            ));
          } else if (event.currentUserId == currentState.user['id']) {
            emit(ProfileLoaded(
              user: currentUserProfile,
              blogs: currentState.blogs,
              isFollowing: currentState.isFollowing,
            ));
          } else {
            emit(ProfileLoaded(
              user: currentState.user,
              blogs: currentState.blogs,
              isFollowing: !wasFollowing,
            ));
          }
        } catch (e) {
          debugPrint('ToggleFollow error: ${e.toString()}');
          emit(ProfileError('Failed to toggle follow: ${e.toString()}'));
          emit(currentState);
        }
      }
    });

    on<LogoutRequested>((event, emit) async {
      try {
        await _authRepository.logout();
        event.context?.go('/login');
      } catch (e) {
        debugPrint('LogoutRequested error: ${e.toString()}');
        emit(ProfileError('Failed to logout: ${e.toString()}'));
      }
    });

    on<LoadUpgradeRequests>((event, emit) async {
      try {
        emit(ProfileLoading());
        final requests = await repository.fetchPendingUpgradeRequests();
        emit(UpgradeRequestsLoaded(requests));
      } catch (e) {
        debugPrint('LoadUpgradeRequests error: ${e.toString()}');
        emit(ProfileError('Failed to load upgrade requests: ${e.toString()}'));
      }
    });

    on<ReviewUpgradeRequest>((event, emit) async {
      try {
        emit(ProfileLoading());

        final currentUser = Supabase.instance.client.auth.currentUser;
        final reviewedBy = currentUser?.id;

        final updates = {
          'status': event.status,
          'reviewed_at': DateTime.now().toIso8601String(),
          if (reviewedBy != null) 'reviewed_by': reviewedBy,
          if (event.rejectionReason != null) 'rejection_reason': event.rejectionReason,
        };

        await Supabase.instance.client
            .from('upgrade_requests')
            .update(updates)
            .eq('id', event.requestId);

        if (event.status == 'approved' && event.requestedValue != null) {
          await Supabase.instance.client
              .from('users')
              .update({'usertype': event.requestedValue?.toLowerCase()})
              .eq('id', event.userId);
        }

        final requests = await Supabase.instance.client
            .from('upgrade_requests')
            .select()
            .eq('status', 'pending');

        emit(UpgradeRequestsLoaded(requests));
      } catch (e) {
        debugPrint('ReviewUpgradeRequest error: ${e.toString()}');
        emit(ProfileError('Failed to review request: ${e.toString()}'));
      }
    });

    on<RequestUpgrade>((event, emit) async {
      debugPrint('Handling RequestUpgrade event for userId: ${event.userId}');
      try {
        emit(ProfileLoading());

        List<String> fileUrls = [];
        if (event.files != null && event.files!.isNotEmpty) {
          for (var file in event.files!) {
            final filePath = 'upgrades/${event.userId}/${DateTime.now().millisecondsSinceEpoch}_${file.name}';
            debugPrint('Uploading file: $filePath');
            try {
              await Supabase.instance.client.storage
                  .from('documents')
                  .upload(filePath, File(file.path!));
              final publicUrl = Supabase.instance.client.storage.from('documents').getPublicUrl(filePath);
              fileUrls.add(publicUrl);
              debugPrint('Uploaded file URL: $publicUrl');
            } catch (e) {
              debugPrint('Upload error for file $filePath: ${e.toString()}');
              throw Exception('Failed to upload file: ${e.toString()}');
            }
          }
        }

        await repository.requestUserUpgrade(
          userId: event.userId,
          requestType: event.requestType,
          requestedValue: event.requestedValue,
          businessId: event.businessId ?? 'default_business_id',
          fileUrls: fileUrls,
        );

        emit(ProfileSuccess(message: 'submit successfully'));
        debugPrint('Emitted ProfileSuccess: submit successfully');
        final updatedUser = await repository.fetchUserProfile(event.userId);
        final blogs = await repository.fetchUserBlogs(event.userId);

        emit(ProfileLoaded(
          user: updatedUser,
          blogs: blogs,
          isFollowing: state is ProfileLoaded ? (state as ProfileLoaded).isFollowing : false,
        ));
      } catch (e) {
        debugPrint('Error in RequestUpgrade: ${e.toString()}');
        emit(ProfileError('Failed to request upgrade: ${e.toString()}'));
        if (state is ProfileLoaded) {
          emit(state);
        } else {
          emit(ProfileInitial());
        }
      }
    });

    on<ResetProfile>((event, emit) async {
      emit(ProfileInitial());
    });
  }
}