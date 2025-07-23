import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  final String userId;

  const LoadProfile(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UpdateProfile extends ProfileEvent {
  final String userId;
  final String? name;
  final String? bio;
  final String? location;
  final String? banner;
  final String? userType;

  const UpdateProfile({
    required this.userId,
    this.name,
    this.bio,
    this.location,
    this.banner,
    this.userType,
  });

  @override
  List<Object?> get props => [userId, name, bio, location, banner, userType];
}

class UpdateProfilePicture extends ProfileEvent {
  final String userId;
  final File imageFile;

  const UpdateProfilePicture(this.userId, this.imageFile);

  @override
  List<Object?> get props => [userId, imageFile];
}

class ToggleFollow extends ProfileEvent {
  final String currentUserId;
  final String profileUserId;

  const ToggleFollow(this.currentUserId, this.profileUserId);

  @override
  List<Object?> get props => [currentUserId, profileUserId];
}

class LogoutRequested extends ProfileEvent {
  final BuildContext? context;

  const LogoutRequested(this.context);

  @override
  List<Object?> get props => [context];
}

class LoadUpgradeRequests extends ProfileEvent {
  const LoadUpgradeRequests();

  @override
  List<Object?> get props => [];
}

class ReviewUpgradeRequest extends ProfileEvent {
  final String requestId;
  final String userId;
  final String status;
  final String? requestedValue;
  final String? rejectionReason;

  const ReviewUpgradeRequest({
    required this.requestId,
    required this.userId,
    required this.status,
    this.requestedValue,
    this.rejectionReason,
  });

  @override
  List<Object?> get props => [requestId, userId, status, requestedValue, rejectionReason];
}

class RequestUpgrade extends ProfileEvent {
  final String userId;
  final String requestType;
  final String requestedValue;
  final String? businessId;
  final List<PlatformFile>? files;

  const RequestUpgrade({
    required this.userId,
    required this.requestType,
    required this.requestedValue,
    this.businessId,
    this.files,
  });

  @override
  List<Object?> get props => [userId, requestType, requestedValue, businessId, files];
}

class ResetProfile extends ProfileEvent {
  const ResetProfile();

  @override
  List<Object?> get props => [];
}