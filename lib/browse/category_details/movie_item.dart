import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  String path = "https://image.tmdb.org/t/p/w500";
  String imagePath;
  String title;
  String date;

  MovieItem({required this.imagePath, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 20, right: 20),
      child: Row(
        children: [
          /// movie image
          Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: width * 0.4,
              height: height * 0.12,
              child: Image.network(
                path + imagePath,
                fit: BoxFit.fill,
              )),

          /// movie details in column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    date.substring(0, 4),
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
