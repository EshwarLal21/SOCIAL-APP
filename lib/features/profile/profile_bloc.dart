import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/data/repositories/profile_repository.dart';
import 'package:torogi/data/repositories/auth_repository.dart';
import 'package:go_router/go_router.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;
  final AuthRepository _authRepository = AuthRepository();

  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final user = await repository.fetchUserProfile(event.userId);
        final blogs = await repository.fetchUserBlogs(event.userId);
        final currentUserId = Supabase.instance.client.auth.currentUser?.id;
        final isFollowing = currentUserId != null ? await repository.checkIfFollowing(
          currentUserId,
          event.userId,
        ) : false;
        emit(ProfileLoaded(
          user: user,
          blogs: blogs,
          isFollowing: isFollowing,
        ));
      } catch (e) {
        emit(ProfileError(e.toString()));
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
          );

          // Reload the profile to get updated data
          final updatedUser = await repository.fetchUserProfile(event.userId);
          final blogs = await repository.fetchUserBlogs(event.userId);
          
          emit(ProfileLoaded(
            user: updatedUser,
            blogs: blogs,
            isFollowing: currentState.isFollowing,
          ));
        } catch (e) {
          emit(ProfileError(e.toString()));
          emit(currentState); // Revert to previous state
        }
      }
    });

    on<UpdateProfilePicture>((event, emit) async {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        try {
          emit(ProfileLoading());
          
          await repository.uploadProfilePicture(
            event.userId,
            event.imageFile,
          );

          // Reload the profile to get updated data
          final updatedUser = await repository.fetchUserProfile(event.userId);
          final blogs = await repository.fetchUserBlogs(event.userId);
          
          emit(ProfileLoaded(
            user: updatedUser,
            blogs: blogs,
            isFollowing: currentState.isFollowing,
          ));
        } catch (e) {
          emit(ProfileError(e.toString()));
          emit(currentState); // Revert to previous state
        }
      }
    });

    on<ToggleFollow>((event, emit) async {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        try {
          final wasFollowing = currentState.isFollowing;

          if (wasFollowing) {
            await repository.unfollowUser(
              event.currentUserId,
              event.profileUserId,
            );
          } else {
            await repository.followUser(
              event.currentUserId,
              event.profileUserId,
            );
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
          emit(ProfileError(e.toString()));
          emit(currentState);
        }
      }
    });

    on<LogoutRequested>((event, emit) async {
      try {
      await _authRepository.logout();
        event.context?.go('/login');
      } catch (e) {
        emit(ProfileError('Failed to logout: ${e.toString()}'));
      }
    });
  }
}