import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torogi/data/repositories/home_repositories/service_repository.dart';
import 'services_event.dart';
import 'services_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceRepository repository;

  ServiceBloc(this.repository) : super(ServiceInitial()) {
    on<LoadServicesByCategory>((event, emit) async {
      emit(ServiceLoading());
      try {
        final services = await repository.fetchServicesByCategory(event.category);
        emit(ServiceLoaded(services));
      } catch (e) {
        emit(ServiceError(e.toString()));
      }
    });

    on<LoadAllServices>((event, emit) async {
      emit(ServiceLoading());
      try {
        final services = await repository.fetchAllServices();
        emit(ServiceLoaded(services));
      } catch (e) {
        emit(ServiceError(e.toString()));
      }
    });
  }
}