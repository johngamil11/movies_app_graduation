import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  String poster;

  PosterWidget({required this.poster});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //image
        Container(
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
            print("ttlwn asfar w check mark +  el film ytzwd fl watchlist");
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
    );
  }
}
