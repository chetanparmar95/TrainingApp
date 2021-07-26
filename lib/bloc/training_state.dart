import 'package:equatable/equatable.dart';
import 'package:my_training_app/models/models.dart';

abstract class TrainingState extends Equatable {
  const TrainingState();

  @override
  List<Object> get props => [];
}

class TrainingEmpty extends TrainingState {}

class TrainingLoading extends TrainingState {}

class TrainingLoaded extends TrainingState {
  final List<Training> trainings;
  const TrainingLoaded({required this.trainings});

  List<Training> getState(){
    return this.trainings;
  }

  @override
  List<Object> get props => [trainings];
}

class TrainingError extends TrainingState {}