import 'package:flutter/material.dart';
import 'package:movies_app_team/home/new_releases/new_releases_get_api.dart';
import 'package:movies_app_team/home/recomended/recomended_get_api.dart';

import '../colors.dart';

class HomePage extends StatelessWidget {
  // var resultList;
  // HomePage({required this.resultList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColor.primaryColor,
        ),
        Container(
          child: SingleChildScrollView(
            child: Column(children: [
              /// todo scroll movie poster
              RecomendedGetApi(),
              SizedBox(
                height: height * 0.03,
              ),

              /// todo new releases movies
              NewReleasesGetApi(),
              SizedBox(
                height: height * 0.03,
              ),

              /// todo Recommended Movies
              RecomendedGetApi()
            ]),
          ),
        ),
      ],
    );
  }
}
