import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_training_app/models/models.dart';
import 'package:my_training_app/repositories/repositories.dart';

class TrainingApiClient {

  final http.Client httpClient;
  final API api;

  TrainingApiClient({
    required this.httpClient, required this.api
  });

  Future<List<Training>> fetchTrainings() async {
    final response = await httpClient.get(api.trainingsUri());

    if (response.statusCode != 200) {
      throw new Exception('error getting trainings');
    }

    final json = jsonDecode(response.body);
    List<dynamic>? trainingList = json != null ? List.from(json) : null;
    if(trainingList != null){
      List<Training> trainings = List<Training>.from(trainingList.map((object)=> Training.fromJson(object)));
      return trainings;
    }
    return [];
  }

  Future<List<Training>> fetchHighlights() async {
    final response = await httpClient.get(api.trainingHighlightUri());

    if (response.statusCode != 200) {
      throw new Exception('error getting trainings');
    }

    final json = jsonDecode(response.body);
    List<dynamic>? trainingList = json != null ? List.from(json) : null;
    if(trainingList != null){
      List<Training> trainings = List<Training>.from(trainingList.map((object)=> Training.fromJson(object)));
      return trainings;
    }
    return [];
  }
}