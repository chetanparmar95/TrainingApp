import 'package:flutter/material.dart';
import 'package:my_training_app/models/models.dart';

class SummaryRoute extends StatelessWidget {

  final Training training;
  const SummaryRoute({Key? key, required this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training Summary"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 20),
        ),
      ),
      body: Center(
        child: Text(this.training.summary)
      ),
    );
  }
}