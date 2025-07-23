import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Map<String, dynamic> user;
  final List<Map<String, dynamic>> blogs;
  final bool isFollowing;

  const ProfileLoaded({
    required this.user,
    this.blogs = const [],
    this.isFollowing = false,
  });

  @override
  List<Object?> get props => [user, blogs, isFollowing];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProfileUpgradeSuccess extends ProfileState {
  final String requestType;
  final String requestedValue;

  const ProfileUpgradeSuccess({
    required this.requestType,
    required this.requestedValue,
  });

  @override
  List<Object?> get props => [requestType, requestedValue];
}

class ProfilePictureUpdated extends ProfileState {
  final String imageUrl;

  const ProfilePictureUpdated(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class ProfileSuccess extends ProfileState {
  final String message;

  const ProfileSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpgradeRequestsLoaded extends ProfileState {
  final List<Map<String, dynamic>> requests;

  const UpgradeRequestsLoaded(this.requests);

  @override
  List<Object?> get props => [requests];
}