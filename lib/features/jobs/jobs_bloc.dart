import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/data/repositories/job_repository.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobRepository _jobRepository;

  JobsBloc(this._jobRepository) : super(JobsInitial()) {
    on<LoadJobs>((event, emit) async {
    emit(JobsLoading());
    try {
        final jobs = await _jobRepository.getJobs();
        emit(JobsLoaded(jobs));
    } catch (e) {
        emit(JobsError(e.toString()));
    }
    });

    on<LoadUserJobs>((event, emit) async {
    emit(JobsLoading());
    try {
        final jobs = await _jobRepository.getJobsByUserId(event.userId);
        emit(JobsLoaded(jobs));
    } catch (e) {
        emit(JobsError(e.toString()));
    }
    });

    on<LoadJobById>((event, emit) async {
    emit(JobsLoading());
    try {
        final job = await _jobRepository.getJobById(event.jobId);
      emit(JobLoadSuccess(job));
    } catch (e) {
        emit(JobsError(e.toString()));
    }
    });

    on<CreateJob>((event, emit) async {
    try {
        await _jobRepository.createJob(
        jobTitle: event.jobTitle,
        jobDesc: event.jobDesc,
        jobLocation: event.jobLocation,
        contact: event.contact,
        slots: event.slots,
        salary: event.salary,
        postDuration: event.postDuration,
      );
        add(LoadJobs()); // Refresh the jobs list
    } catch (e) {
        emit(JobsError(e.toString()));
    }
    });

    on<UpdateJob>((event, emit) async {
    try {
        await _jobRepository.updateJob(
        jobId: event.jobId,
        jobTitle: event.jobTitle,
        jobDesc: event.jobDesc,
        jobLocation: event.jobLocation,
        contact: event.contact,
        slots: event.slots,
        salary: event.salary,
        postDuration: event.postDuration,
      );
        add(LoadJobs()); // Refresh the jobs list
    } catch (e) {
        emit(JobsError(e.toString()));
    }
    });

    on<DeleteJob>((event, emit) async {
    try {
        await _jobRepository.deleteJob(event.jobId);
        add(LoadJobs()); // Refresh the jobs list
    } catch (e) {
        emit(JobsError(e.toString()));
    }
    });

    on<SearchJobs>((event, emit) async {
    emit(JobsLoading());
    try {
        final jobs = await _jobRepository.searchJobs(event.query);
        emit(JobsLoaded(jobs));
    } catch (e) {
        emit(JobsError(e.toString()));
    }
    });
  }
}