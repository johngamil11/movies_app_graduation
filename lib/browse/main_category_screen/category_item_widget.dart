import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  String categoryName;
  String image;

  CategoryItemWidget({required this.categoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      // width: width * 0.3,
      // height: height * 0.1,
      color: Colors.black,
      child: Center(
          child: Stack(children: [
        ///todo: image
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Text(
            categoryName,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ])),
    );
  }
}
