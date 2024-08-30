import 'package:flutter/material.dart';
import 'package:movies_app_team/colors.dart';

class PosterRecomendedWidget extends StatelessWidget {
  String poster;
  double rating;
  String movieName;
  String time;

  PosterRecomendedWidget(
      {required this.poster,
      required this.rating,
      required this.movieName,
      required this.time});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      // decoration: const BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      // ),
      width: width * 0.27,
      height: height * 0.33,
      color: AppColor.posterGreyBackground,
      child: Column(
        children: [
          //poster
          Stack(
            children: [
              //image poster
              Container(
                  height: height * 0.21,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Image.network(
                    poster,
                    fit: BoxFit.fill,
                  )),

              //watchlist logo + or check
              InkWell(
                onTap: () {
                  /// todo yb3at el film lel watchlist ya mario
                  print(
                      "ttlwn asfar w check mark +  el film ytzwd fl watchlist");
                },
                child: Stack(children: [
                  ImageIcon(
                    AssetImage(
                      "assets/images/watchlist_poster_icon.png",
                    ),
                    color: Color(0xff514F4F),
                    size: 40,
                  ),
                  Positioned(
                    left: 7,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ]),
              )
            ],
          ),
          // movie details
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // star with rating

              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColor.goldColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    rating.toStringAsFixed(1),
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              //movie name
              Text(
                movieName,
                style: TextStyle(color: Colors.white),
              ),
              //year + R + movie time
              Text(
                time.substring(0, 4),
                style: TextStyle(color: AppColor.textGreyColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
