import 'package:flutter/material.dart';
import 'package:movies_app_team/browse/category_details/movie_item.dart';
import 'package:movies_app_team/colors.dart';

class MoviesList extends StatelessWidget {
  var resultList;

  MoviesList({required this.resultList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              MovieItem(
                  imagePath: resultList[index].backdropPath ?? "",
                  title: resultList[index].title ?? "",
                  date: resultList[index].releaseDate ?? ""),
              Divider(
                color: AppColor.goldColor,
                endIndent: 10,
                indent: 10,
              )
            ],
          );
        },
        itemCount: resultList.length,
      ),
    );
  }
}
