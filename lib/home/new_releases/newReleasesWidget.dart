import 'package:flutter/material.dart';
import 'package:movies_app_team/home/new_releases/poster_widget.dart';

import '../../colors.dart';

class NewReleasesWidget extends StatelessWidget {
  var resultList;

  String path = "https://image.tmdb.org/t/p/w500";

  NewReleasesWidget({required this.resultList});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.25,
      color: AppColor.widgetBackground,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "New Releases 🔥",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: PosterWidget(
                      poster: path + resultList[index].posterPath ?? ""),
                );
              },
              itemCount: resultList.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
