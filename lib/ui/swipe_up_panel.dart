import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_training_app/bloc/bloc.dart';
import 'package:my_training_app/models/models.dart';
import 'package:my_training_app/ui/components/filter_locations.dart';
import 'package:my_training_app/ui/components/filter_options.dart';
import 'package:my_training_app/ui/components/filter_trainer_name.dart';
import 'package:my_training_app/ui/components/filter_training.dart';

class SwipeUpPanel extends StatefulWidget {
  final Function() onClose;
  const SwipeUpPanel({Key? key, required this.onClose}) : super(key: key);

  @override
  _SwipeUpPanelState createState() => _SwipeUpPanelState();
}

class _SwipeUpPanelState extends State<SwipeUpPanel> {

  int _selectedFilterOptionIndex = 1;
  _onSelected(int index) {
    setState(() => _selectedFilterOptionIndex = index > 0 ? index : _selectedFilterOptionIndex);
  }

  late var _filterLocationOptions = <Location>{};
  late var _filterUserOptions = <User>{};
  late var _filterTrainingOptions = <TrainingFilterOptions>{};

  _filterData({Set<Location>? locations, Set<User>? users, Set<TrainingFilterOptions>? trainings}) {
    if(locations != null){
      setState(() {
        this._filterLocationOptions = locations;
      });
    }
    if(users != null){
      setState(() {
        this._filterUserOptions = users;
      });
    }
    if(trainings != null){
      setState(() {
        this._filterTrainingOptions = trainings;
      });
    }
    BlocProvider.of<TrainingBloc>(context).add(FilterTrainingEvent(
        locations: this._filterLocationOptions,
        users: this._filterUserOptions,
        training: this._filterTrainingOptions
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sort and Filters",
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                // IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                InkWell(
                  onTap: widget.onClose,
                  child: Icon(FlutterIcons.cross_ent),
                )
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              )
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: FilterOptions(onSelected: _onSelected, selectedIndex: _selectedFilterOptionIndex,)
              ),
              Expanded(
                flex: 3,
                child: renderFilter()
              )
            ],
          )
        ],
      ),
    );
  }

  renderFilter(){
    switch(_selectedFilterOptionIndex){
      case 1: return FilterLocations(filterDataCallback: _filterData, saved: _filterLocationOptions);
      case 2: return FilterTrainerName(filterDataCallback: _filterData, saved: _filterUserOptions);
      case 3: return FilterTraining(filterDataCallback: _filterData, saved: _filterTrainingOptions);
      default: return Container();
    }
  }
}
