import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:io';

/// Abstract base class for all profile-related events
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

/// Load a user profile event
class LoadProfile extends ProfileEvent {
  final String userId;

  const LoadProfile(this.userId);

  @override
  List<Object> get props => [userId];
}

/// Update a user's name and bio
class UpdateProfile extends ProfileEvent {
  final String userId;
  final String? name;
  final String? bio;

  const UpdateProfile({
    required this.userId,
    this.name,
    this.bio,
  });

  @override
  List<Object?> get props => [userId, name, bio];
}

/// Update a user's profile picture
class UpdateProfilePicture extends ProfileEvent {
  final String userId;
  final File imageFile;

  const UpdateProfilePicture({
    required this.userId,
    required this.imageFile,
  });

  @override
  List<Object> get props => [userId, imageFile];
}

/// Toggle following/unfollowing a user
class ToggleFollow extends ProfileEvent {
  final String currentUserId;
  final String profileUserId;

  const ToggleFollow(this.currentUserId, this.profileUserId);

  @override
  List<Object> get props => [currentUserId, profileUserId];
}

/// Directly upgrade a user's type (not typically recommended, replaced by RequestUpgrade)
class UpgradeUserType extends ProfileEvent {
  final String userId;
  final String userType;

  const UpgradeUserType({
    required this.userId,
    required this.userType,
  });

  @override
  List<Object> get props => [userId, userType];
}

/// Directly upgrade a user's banner (not typically recommended, replaced by RequestUpgrade)
class UpgradeBanner extends ProfileEvent {
  final String userId;
  final String banner;

  const UpgradeBanner({
    required this.userId,
    required this.banner,
  });

  @override
  List<Object> get props => [userId, banner];
}

/// Request to log out and navigate back to login
class LogoutRequested extends ProfileEvent {
  final BuildContext context;

  const LogoutRequested(this.context);

  @override
  List<Object> get props => [context];
}

/// User requests an upgrade (for user type or banner)
class RequestUpgrade extends ProfileEvent {
  final String userId;
  final String requestType;       // e.g. 'usertype' or 'banner'
  final String requestedValue;    // e.g. 'employer' or 'gold'

  const RequestUpgrade({
    required this.userId,
    required this.requestType,
    required this.requestedValue,
  });

  @override
  List<Object> get props => [userId, requestType, requestedValue];
}
