import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final Function() callback;
  const FilterButton({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90,
        height: 30,
        margin: EdgeInsets.all(16),
        child: OutlinedButton(
          onPressed: () { callback(); },
          // onPressed: () => _pc.isAttached ? _pc.open() : null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: new BorderSide(width: 4, color: Colors.red) )),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.filter, color: Color.fromRGBO(156, 156, 156, 1), size: 16,)
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Filter",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromRGBO(156, 156, 156, 1)),
                  )
              )
            ],
          ),

        )
    );
  }
}
