part of 'jobs_bloc.dart';

abstract class JobsEvent {}

class LoadJobs extends JobsEvent {}

class CreateJob extends JobsEvent {
  final String jobTitle;
  final String jobDesc;
  final String jobLocation;
  final String contact;
  final int slots;
  final double salary;
  final DateTime postDuration;

  CreateJob({
    required this.jobTitle,
    required this.jobDesc,
    required this.jobLocation,
    required this.contact,
    required this.slots,
    required this.salary,
    required this.postDuration,
  });
}

class UpdateJob extends JobsEvent {
  final String jobId;
  final String jobTitle;
  final String jobDesc;
  final String jobLocation;
  final String contact;
  final int slots;
  final double salary;
  final DateTime postDuration;

  UpdateJob({
    required this.jobId,
    required this.jobTitle,
    required this.jobDesc,
    required this.jobLocation,
    required this.contact,
    required this.slots,
    required this.salary,
    required this.postDuration,
  });
}

class DeleteJob extends JobsEvent {
  final String jobId;

  DeleteJob(this.jobId);
}

class SearchJobs extends JobsEvent {
  final String query;

  SearchJobs(this.query);
}

class LoadUserJobs extends JobsEvent {
  final String userId;

  LoadUserJobs(this.userId);
}

class LoadJobById extends JobsEvent {
  final String jobId;

  LoadJobById(this.jobId);
}