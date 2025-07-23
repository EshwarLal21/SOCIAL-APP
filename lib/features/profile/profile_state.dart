import 'package:equatable/equatable.dart';

/// Abstract base class for all profile-related states
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any profile operation occurs
class ProfileInitial extends ProfileState {}

/// Loading state while profile data is being fetched or updated
class ProfileLoading extends ProfileState {}

/// Loaded state when profile data has been successfully retrieved
class ProfileLoaded extends ProfileState {
  final Map<String, dynamic> user;
  final List<Map<String, dynamic>> blogs;
  final bool isFollowing;

  const ProfileLoaded({
    required this.user,
    required this.blogs,
    required this.isFollowing,
  });

  @override
  List<Object?> get props => [user, blogs, isFollowing];
}

/// Error state when a failure occurs during a profile operation
class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

/// State emitted when an upgrade request is successfully submitted
class ProfileUpgradeRequestedSuccess extends ProfileState {
  final String requestType;
  final String requestedValue;

  const ProfileUpgradeRequestedSuccess({
    required this.requestType,
    required this.requestedValue,
  });

  @override
  List<Object?> get props => [requestType, requestedValue];
}
