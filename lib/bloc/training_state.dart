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

  List<Training> clone(List<Training> trainings){
    List<Training> clone = [];
    trainings.forEach((e) {
      clone.add(new Training(e.id, e.name, e.status, User(e.speaker.id, e.speaker.name), e.speakerPicUrl, e.coverPic,
          Location(e.location.id, e.location.name, e.location.address), e.date, e.fromTime, e.toTime, e.oldPrice, e.newPrice, e.summary));
    });
    return clone;
  }

  List<Training> getState(){
    return this.trainings;
  }

  @override
  List<Object> get props => [trainings];
}

class TrainingError extends TrainingState {}