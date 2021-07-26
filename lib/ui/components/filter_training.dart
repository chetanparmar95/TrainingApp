import 'package:flutter/material.dart';
import 'package:my_training_app/models/models.dart';

class FilterTraining extends StatefulWidget {
  final Function({Set<TrainingFilterOptions>? trainings}) filterDataCallback;
  final Set<TrainingFilterOptions> saved;
  const FilterTraining({Key? key, required this.filterDataCallback, required this.saved}) : super(key: key);


  @override
  _FilterTrainingState createState() => _FilterTrainingState();
}

class _FilterTrainingState extends State<FilterTraining> {

  final List<TrainingFilterOptions> trainings = [
    TrainingFilterOptions(1,"Safe Scrum Master"),
    TrainingFilterOptions(2,"React Native"),
    TrainingFilterOptions(3,"Flutter"),
    TrainingFilterOptions(4,"Nodejs"),
    TrainingFilterOptions(5,"Android/iOS App"),
  ];

  String? search;

  @override
  Widget build(BuildContext context) {

    List<TrainingFilterOptions> listToShow;
    if (search != null)
      listToShow = trainings.where((e) => e.name.toLowerCase().contains(search!.toLowerCase())).toList();
    else
      listToShow = trainings;

    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
                onChanged: (input) {
                  setState(() {
                    this.search = input;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.primaries[0])
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  prefixText: ' ',
                )
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: listToShow.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return _buildTrainingRow(listToShow[index]);
              },
            )
          ],
        )
    );
  }

  Widget _buildTrainingRow(TrainingFilterOptions training){
    final alreadySaved = widget.saved.contains(training);

    return Container(
        child: Row(
          children: [
            Checkbox(value: alreadySaved,checkColor: Colors.white, activeColor: Colors.primaries[0], onChanged: (bool? value) {
              setState(() {
                if(alreadySaved){
                  widget.saved.remove(training);
                  widget.filterDataCallback(trainings: widget.saved);
                }else{
                  widget.saved.add(training);
                  widget.filterDataCallback(trainings: widget.saved);
                }
              });
            }),
            Text(training.name.toString(), style: TextStyle(fontWeight: FontWeight.bold))
          ],
        )
    );
  }
}
