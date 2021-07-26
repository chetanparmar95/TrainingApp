import 'package:flutter/material.dart';

class FilterOptions extends StatefulWidget {
  final Function onSelected;
  final int selectedIndex;
  const FilterOptions({Key? key, required this.onSelected, required this.selectedIndex}) : super(key: key);

  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {

  final List<String> filterOptions = <String>["Sort by", "Location", "Trainer Name", "Training"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: filterOptions.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return InkWell(
          onTap: () => widget.onSelected(index),
          child: _buildFilterOptionRow(filterOptions[index], index, widget.selectedIndex),
        );
      },
    );
  }

  Widget _buildFilterOptionRow(String option, index, selectedIndex){

    if(index == selectedIndex){
      return Container(
        width: double.infinity,
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 5,
              height: 50,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 73, 84, 1)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(option, style: TextStyle(fontSize: 14)),
            )
          ],
        ),
      );
    }else{
      return Container(
        child: Container(
            width: double.infinity,
            height: 50,
            color: Color.fromRGBO(242, 242, 242, 1),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                children: [
                  Text(option, style: TextStyle(fontSize: 14)),
                ]
            )
        ),
      );
    }
  }
}
