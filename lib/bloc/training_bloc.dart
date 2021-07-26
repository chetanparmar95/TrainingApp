import 'package:bloc/bloc.dart';
import 'package:my_training_app/bloc/bloc.dart';
import 'package:my_training_app/models/models.dart';
import 'package:my_training_app/repositories/repository.dart';


class TrainingBloc extends Bloc<AllTrainingEvent, TrainingState> {
  final TrainingRepository repository;

  TrainingBloc({required this.repository}) : super(TrainingEmpty());

  TrainingState get initialState => TrainingEmpty();

  @override
  Stream<TrainingState> mapEventToState(AllTrainingEvent event) async* {
    print(event);
    if (event is FetchTraining) {
      yield TrainingLoading();
      try {
        final List<Training> trainings = await repository.fetchTrainings();
        // yield TrainingFiltered(trainings: trainings);
        yield TrainingLoaded(trainings: trainings);
      } catch (exception) {
        print("Error $exception");
        yield TrainingError();
      }
    }else if(event is FilterTrainingEvent){
      List<int> locationIds = event.locations.map((e) => e.id).toList();
      List<int> userIds = event.users.map((e) => e.id).toList();
      List<int> trainingIds = event.training.map((e) => e.id).toList();

      final List<Training> trainings = await repository.fetchTrainings();
      if(locationIds.isEmpty && userIds.isEmpty && trainingIds.isEmpty){
        yield TrainingLoaded(trainings: trainings );
      }else{
        List<Training> filtered = trainings;
        if(locationIds.length > 0){
          filtered = filtered.where((element) => locationIds.contains(element.location.id)).toList();
        }
        if(userIds.length > 0){
          filtered = filtered.where((element) => userIds.contains(element.speaker.id)).toList();
        }
        if(trainingIds.length > 0){
          filtered = filtered.where((element) => trainingIds.contains(element.id)).toList();
        }
        yield TrainingLoaded(trainings: filtered);
      }
    }
  }

  @override
  void onEvent(AllTrainingEvent event) {
    super.onEvent(event);
    // print(event);
  }

  @override
  void onChange(Change<TrainingState> change) {
    super.onChange(change);
    // print(change);
  }

  @override
  void onTransition(Transition<AllTrainingEvent, TrainingState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}