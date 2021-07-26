import 'package:flutter/material.dart';
import 'package:my_training_app/models/models.dart';

class FilterLocations extends StatefulWidget {
  final Function({Set<Location>? locations}) filterDataCallback;
  final Set<Location> saved;
  const FilterLocations({Key? key, required this.filterDataCallback, required this.saved}) : super(key: key);

  @override
  _FilterLocationsState createState() => _FilterLocationsState();
}

class _FilterLocationsState extends State<FilterLocations> {

  List<Location> locations = <Location>[
    Location(1,"West Des Moines, IA", ""),
    Location(2,"Chicago, IL",""),
    Location(3,"Phoenix, AZ",""),
    Location(4,"Dallas, TX",""),
    Location(5,"San Diego, CA",""),
    Location(6,"San Fransisco, CA",""),
    Location(7,"New York, ZK",""),
  ];

  String? search;

  @override
  Widget build(BuildContext context) {
    List<Location> listToShow;
    if (search != null)
      listToShow = locations.where((e) => e.name.toLowerCase().contains(search!.toLowerCase())).toList();
    else
      listToShow = locations;

      return Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
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
                  padding: EdgeInsets.only(bottom: 50),
                  itemCount: listToShow.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return _buildLocationsRow(listToShow[index]);
                  },
                ),
              ],
            ),
          )
      );
  }

  Widget _buildLocationsRow(Location location){
    final alreadySaved = widget.saved.contains(location);

    return Container(
        child: Row(
          children: [
            Checkbox(value: alreadySaved,checkColor: Colors.white, activeColor: Colors.primaries[0], onChanged: (bool? value) {
              setState(() {
                if(alreadySaved){
                  widget.saved.remove(location);
                  widget.filterDataCallback(locations: widget.saved);
                }else{
                  widget.saved.add(location);
                  widget.filterDataCallback(locations: widget.saved);
                }
              });
            }),
            Text(location.name.toString(), style: TextStyle(fontWeight: FontWeight.bold))
          ],
        )
    );
  }
}
