import 'package:equatable/equatable.dart';
import 'package:my_training_app/models/models.dart';

abstract class AllTrainingEvent extends Equatable {
  const AllTrainingEvent();
}

class FetchTraining extends AllTrainingEvent {
  const FetchTraining();

  @override
  List<Object> get props => [];
}

class FetchHighlights extends AllTrainingEvent {
  const FetchHighlights();

  @override
  List<Object> get props => [];
}

class FilterTrainingEvent extends AllTrainingEvent {
  final Set<Location> locations;
  final Set<User> users;
  final Set<TrainingFilterOptions> training;
  const FilterTrainingEvent({required this.locations, required this.users, required this.training});

  @override
  List<Object> get props => [];
}