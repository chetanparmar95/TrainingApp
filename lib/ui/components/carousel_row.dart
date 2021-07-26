import 'package:flutter/material.dart';
import 'package:my_training_app/models/models.dart';

class CarouselRow extends StatelessWidget {
  final Training highlight;
  const CarouselRow({Key? key, required this.highlight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox.expand(
              child: FittedBox(
                child: Image(image: NetworkImage(highlight.coverPic)),
                fit: BoxFit.fill,
              ),
            )
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          color: Color.fromRGBO(0, 0, 0, 0.6),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.all(10),
                // width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        highlight.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "${highlight.location.name} - ${highlight.date}",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$${highlight.oldPrice} ",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.primaries[0]
                                    ),
                                  ),
                                  Text(
                                    "\$${highlight.newPrice}",
                                    style: TextStyle(
                                        color: Colors.primaries[0],
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Row(
                            children: [
                              Text("View Details", style: TextStyle(fontSize: 12, color: Colors.white)),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 12)
                            ],
                          )
                        ],
                      ),
                    )

                  ],
                ),
              )
          ),
        )
      ],
    );
  }
}
