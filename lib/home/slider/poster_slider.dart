import 'package:flutter/material.dart';
import 'package:movies_app_team/home/new_releases/poster_widget.dart';

class PosterSlider extends StatelessWidget {
  var backGround;
  var poster;

  PosterSlider({required this.poster, required this.backGround});

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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PosterWidget(poster: poster),
                Text(
                  "Movie Name and Details",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ))
      ],
    );
  }
}
