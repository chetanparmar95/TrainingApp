import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:my_training_app/models/models.dart';

class TrainingSlot extends StatelessWidget {

  const TrainingSlot({required this.training});
  final Training training;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                height: 100,
                // color: Colors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(training.date,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text("${training.fromTime} - ${training.toTime}",
                      style: TextStyle(fontSize: 8)),
                    Text(training.location.address,
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                width: 10,
                // height: 80,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          DottedLine(
                            dashLength: 4,
                            dashColor: Colors.grey,
                            direction: Axis.vertical,
                            lineLength: 100,
                          ),
                        ],
                      )
                    )
                  ]
                ),
              ),
              Container(
                height: 100,
                // color: Colors.grey,
                width: MediaQuery.of(context).size.width*0.5,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(training.status, style: TextStyle(fontSize: 8, color: Colors.primaries[0]))
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(training.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: CircleAvatar(
                                backgroundImage:  NetworkImage(training.speakerPicUrl)
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/training.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all( Radius.circular(5.0)),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Keynote Speaker",
                                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Text(training.speaker.name,
                                    style: TextStyle(fontSize: 8)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 24,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all(Colors.primaries[0]),
                              padding: MaterialStateProperty.all(EdgeInsets.zero)
                            ),
                            onPressed: () { },
                            child: Text('Enroll Now', style: TextStyle(fontSize: 10)),
                          ),
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      );
  }

}
