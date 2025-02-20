import 'package:flutter/material.dart';
import 'package:movies_app_team/tabs_page.dart';
import 'package:movies_app_team/theme_data.dart';

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
      },
    );
  }
}
