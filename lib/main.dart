import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_training_app/bloc/bloc.dart';
import 'package:my_training_app/repositories/repository.dart';
import 'package:my_training_app/ui/home.dart';
import 'package:my_training_app/ui/swipe_up_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

void main() {
  final TrainingRepository repository = TrainingRepository(
    trainingApiClient: TrainingApiClient(
      httpClient: http.Client(),
      api: API()
    ),
  );
  runApp(MyApp(
    repository: repository
  ));
}

final PanelController _pc = PanelController();

class MyApp extends StatelessWidget {
  final TrainingRepository repository;

  MyApp({Key? key, required this.repository})
      : super(key: key);

  callbackToOpenPanel () {
    if(_pc.isAttached){
      _pc.open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: MultiBlocProvider(
          providers: [
            BlocProvider<TrainingBloc>(create: (context) => TrainingBloc(repository: repository)),
            BlocProvider<HighlightsBloc>(create: (context) => HighlightsBloc(repository: repository)),
          ],
          child: SlidingUpPanel(
            controller: _pc,
            minHeight: 0,
            maxHeight: 550,
            backdropEnabled: true,
            panel:SwipeUpPanel(
              onClose: () {
                _pc.close();
              }
            ),
            body: Home(callbackToOpenPanel),
          ),
      ),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 73, 84, 1),
        secondaryHeaderColor: Colors.grey
      )
    );
  }
}


