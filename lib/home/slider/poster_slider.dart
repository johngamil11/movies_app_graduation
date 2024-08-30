import 'package:flutter/material.dart';
import 'package:movies_app_team/home/new_releases/poster_widget.dart';

class PosterSlider extends StatelessWidget {
  var backGround;
  var poster;
  var title;

  var year;

  PosterSlider(
      {required this.poster,
      required this.backGround,
      required this.title,
      required this.year});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.loose,
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Image.network(
          backGround,
          height: height * 0.5,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Container(
            // color: Colors.white,
            width: double.infinity,
            height: height * 0.2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PosterWidget(poster: poster),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Text(
                      year.toString().substring(0, 4),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
