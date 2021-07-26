import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_training_app/bloc/bloc.dart';
import 'package:my_training_app/ui/components/FilterButton.dart';
import 'package:my_training_app/ui/components/carousel_row.dart';

class HighlightView extends StatelessWidget {
  final Function() callback;

  HighlightView(this.callback);

  final CarouselController buttonCarouselController = CarouselController();

  onNextPage () {
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  onPreviousPage() {
    buttonCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: SizedBox.expand(
                      child: Container(
                          color: Color.fromRGBO(255, 73, 84, 1),
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Text(
                            "Highlights",
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold ),
                          )
                      ),
                    )
                ),
                Expanded(
                    child: Container(
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FilterButton(callback: this.callback)
                        )
                    )
                )
              ],
            ),
            Align(
                child: BlocBuilder<HighlightsBloc, HighlightsState>(
                  builder: (context, state){
                    if (state is HighlightsEmpty) {
                      BlocProvider.of<HighlightsBloc>(context).add(FetchHighlights());
                    }
                    if (state is HighlightsError) {
                      return Center(
                        child: Text('Failed to fetch highlights'),
                      );
                    }
                    if (state is HighlightsLoaded) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: onPreviousPage,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              child: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: CarouselSlider(
                              carouselController: buttonCarouselController,
                              options: CarouselOptions(
                                height: MediaQuery.of(context).size.height*0.2,
                                enableInfiniteScroll: false,
                                viewportFraction: 1,
                              ),
                              items: state.highlights.map((data) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return CarouselRow(highlight: data);
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          GestureDetector(
                            onTap: onNextPage,
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              child: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                )
            )
          ],
        )
    );
  }
}
