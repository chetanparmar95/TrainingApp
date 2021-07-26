import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_training_app/bloc/bloc.dart';
import 'package:my_training_app/ui/components/highlights.dart';
import 'package:my_training_app/ui/components/training_slot.dart';
import 'package:my_training_app/ui/training_summary.dart';

class Home extends StatelessWidget {
  final Function() callback;
  const Home(this.callback);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          title: const Text(
            'Trainings',
            style: const TextStyle(fontSize: 24),
          ),
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.menu, color: Colors.white))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: HighlightView(callback)
            ),
            Expanded(
              flex: 3,
              child: BlocBuilder<TrainingBloc, TrainingState>(
                builder: (context, state) {
                  if (state is TrainingEmpty) {
                    BlocProvider.of<TrainingBloc>(context).add(FetchTraining());
                  }
                  if (state is TrainingError) {
                    return Center(
                      child: Text('Failed to fetch trainings'),
                    );
                  }
                  if (state is TrainingLoaded) {
                    if(state.trainings.isEmpty){
                      return  Center(
                        child: Text('there are no any trainings'),
                      );
                    }else {
                      return SafeArea(child: Container(
                          color: Color.fromRGBO(242, 242, 242, 1),
                          child: ListView.builder(
                              itemCount: state.trainings.length,
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, i) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            SummaryRoute(training: state.trainings[i])),
                                      );
                                    },
                                    child: TrainingSlot(
                                        training: state.trainings[i])
                                );
                              })
                      ));
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ),
          ],
        )
    );
  }
}