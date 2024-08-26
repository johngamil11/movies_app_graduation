import 'package:flutter/material.dart';
import 'package:movies_app_team/search/search_page.dart';
import 'package:movies_app_team/watchlist/watchlist_page.dart';

import 'browse/browse_page.dart';
import 'home/home_page.dart';

class TabsPage extends StatefulWidget {
  static const String routeName = 'bottomNav';

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/Home icon.png")),
                    label: "HOME"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/search-2.png")),
                    label: "SEARCH"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage("assets/images/Icon material-movie.png")),
                    label: "BROWSE"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage("assets/images/Icon ionic-md-bookmarks.png")),
                    label: "WATCHLIST"),
              ],
              onTap: (index) {
                selectedPage = index;
                setState(() {});
              },
              currentIndex: selectedPage,
            ),
            body: tabs[selectedPage],
          ),
        ],
      ),
    );
  }

  List<Widget> tabs = [HomePage(), SearchPage(), BrowsePage(), WatchListPage()];
}
