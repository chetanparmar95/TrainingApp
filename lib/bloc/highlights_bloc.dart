import 'package:bloc/bloc.dart';
import 'package:my_training_app/bloc/bloc.dart';
import 'package:my_training_app/models/models.dart';
import 'package:my_training_app/repositories/repository.dart';


class HighlightsBloc extends Bloc<AllTrainingEvent, HighlightsState> {
  final TrainingRepository repository;

  HighlightsBloc({required this.repository}) : super(HighlightsEmpty());

  TrainingState get initialState => TrainingEmpty();

  @override
  Stream<HighlightsState> mapEventToState(AllTrainingEvent event) async* {
    print(event);
    if (event is FetchHighlights) {
      yield HighlightsLoading();
      try {
        final List<Training> highlights = await repository.fetchTrainingHighlights();
        yield HighlightsLoaded(highlights: highlights);
      } catch (exception) {
        print("Error $exception");
        yield HighlightsError();
      }
    }
  }

  @override
  void onEvent(AllTrainingEvent event) {
    super.onEvent(event);
    // print(event);
  }

  @override
  void onChange(Change<HighlightsState> change) {
    super.onChange(change);
    // print(change);
  }

  @override
  void onTransition(Transition<AllTrainingEvent, HighlightsState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}