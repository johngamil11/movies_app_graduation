import 'package:flutter/material.dart';
import 'package:movies_app_team/colors.dart';
import 'package:movies_app_team/home/recomended/recomended_widget.dart';
import 'package:movies_app_team/movie_details/simillar_get_api.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = 'movieDetailsScreen';
  String path = "https://image.tmdb.org/t/p/w500";

// final String name , description , bannerUrl , postUrl,vote , lunchOn ;
//   MovieDetailsScreen({required this.resultDetailsMovie});
  @override
  Widget build(BuildContext context) {
    var argus =
        ModalRoute.of(context)?.settings.arguments as RecomamendedWidgetArgus;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              argus.name,
              style: TextStyle(color: Colors.white),
            ),

            /// name from api
          ),
          backgroundColor: AppColor.backgroundNavigator,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Stack(children: [
                      Image.network(
                        path + argus.backdropPath.toString(),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Center(
                          child: Icon(
                        Icons.play_circle_filled,
                        size: 100,
                        color: Colors.white70,
                      ))
                    ]),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      argus.name.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      argus.releaseDate.toString().substring(0, 4),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.height * 0.14,
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Image.network(
                          path + argus.posterPath.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              argus.overFlow.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColor.goldColor,
                                ),
                                Text(
                                  argus.voteAverage!.toStringAsFixed(1),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'More Like This',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),

                  SimillarGetApi()
                  // Text(argus.results.originalLanguage.toString(), style: TextStyle(color: Colors.white),),
                  // Text(argus.results.originalTitle.toString(), style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
