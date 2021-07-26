import 'dart:async';

import 'package:my_training_app/models/models.dart';
import 'package:my_training_app/repositories/trainings_api_client.dart';

class TrainingRepository {
  final TrainingApiClient trainingApiClient;
  late List<Training> list = [];

  TrainingRepository({required this.trainingApiClient});

  Future<List<Training>> fetchTrainings() async {
    return await trainingApiClient.fetchTrainings();
  }

  Future<List<Training>> fetchTrainingHighlights() async {
    if(list.length == 0){
      List<Training> list = await trainingApiClient.fetchHighlights();
      this.list = list;
    }
    return this.list;
  }
}