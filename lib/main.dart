import 'package:flutter/material.dart';
import 'package:movies_app_team/movie_details/movie_details_screen.dart';
import 'package:movies_app_team/tabs_page.dart';
import 'package:movies_app_team/theme_data.dart';

import 'browse/category_details/dicover_get_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.primaryTheme,
      initialRoute: TabsPage.routeName,
      routes: {
        TabsPage.routeName: (context) => TabsPage(),
        DiscoverGetApi.routeName: (context) => DiscoverGetApi(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
      },
    );
  }
}
