import 'package:flutter/material.dart';
import 'package:my_training_app/models/models.dart';

class FilterTrainerName extends StatefulWidget {
  final Function({Set<User>? users}) filterDataCallback;
  final Set<User> saved;
  const FilterTrainerName({Key? key, required this.filterDataCallback, required this.saved}) : super(key: key);

  @override
  _FilterTrainerNameState createState() => _FilterTrainerNameState();
}

class _FilterTrainerNameState extends State<FilterTrainerName> {

  final List<User> users = <User>[
    User(1,"Pat Gomez"),
    User(2,"Ramon Owens"),
    User(3,"Lonnie Horton"),
    User(4,"Antonio Craig"),
    User(5,"Nicholas Hale"),
  ];

  String? search;

  @override
  Widget build(BuildContext context) {
    List<User> listToShow;
    if (search != null)
      listToShow = users.where((e) => e.name.toLowerCase().contains(search!.toLowerCase())).toList();
    else
      listToShow = users;

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
                return _buildUsersRow(listToShow[index]);
              },
            ),
          ],
        )
    );
  }

  Widget _buildUsersRow(User user){
    final alreadySaved = widget.saved.contains(user);

    return Container(
        child: Row(
          children: [
            Checkbox(value: alreadySaved,checkColor: Colors.white, activeColor: Colors.primaries[0], onChanged: (bool? value) {
              setState(() {
                if(alreadySaved){
                  widget.saved.remove(user);
                  widget.filterDataCallback(users: widget.saved);
                }else{
                  widget.saved.add(user);
                  widget.filterDataCallback(users: widget.saved);
                }
              });
            }),
            Text(user.name.toString(), style: TextStyle(fontWeight: FontWeight.bold))
          ],
        )
    );
  }
}
