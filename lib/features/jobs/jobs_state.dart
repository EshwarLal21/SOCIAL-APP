part of 'jobs_bloc.dart';

abstract class JobsState {}

class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  final List<Map<String, dynamic>> jobs;

  JobsLoaded(this.jobs);
}

class JobsError extends JobsState {
  final String message;

  JobsError(this.message);
}

class JobLoadSuccess extends JobsState {
  final Map<String, dynamic> job;

  JobLoadSuccess(this.job);
}

class JobCreateSuccess extends JobsState {
  final Map<String, dynamic> job;

  JobCreateSuccess(this.job);
}

class JobUpdateSuccess extends JobsState {
  final Map<String, dynamic> job;

  JobUpdateSuccess(this.job);
}

class JobDeleteSuccess extends JobsState {
  final String jobId;

  JobDeleteSuccess(this.jobId);
}