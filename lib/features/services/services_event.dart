import 'package:equatable/equatable.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class LoadServicesByCategory extends ServiceEvent {
  final String category;

  const LoadServicesByCategory(this.category);

  @override
  List<Object> get props => [category];
}

class LoadAllServices extends ServiceEvent {}