import 'package:flutter/material.dart';
import 'package:movies_app_team/browse/category_details/dicover_get_api.dart';
import 'package:movies_app_team/browse/main_category_screen/category_item_widget.dart';
import 'package:movies_app_team/browse/main_category_screen/image_path_constants.dart';
import 'package:movies_app_team/colors.dart';

class CategoryScreen extends StatelessWidget {
  var resultList;
  var imagesList = [
    ImagePathConstants.actionImage,
    ImagePathConstants.adventureImage,
    ImagePathConstants.animationImage,
    ImagePathConstants.comedyImage,
    ImagePathConstants.crimeImage,
    ImagePathConstants.documentryImage,
    ImagePathConstants.dramaImage,
    ImagePathConstants.familyImage,
    ImagePathConstants.fantasyImage,
    ImagePathConstants.historyImage,
    ImagePathConstants.horrorImage,
    ImagePathConstants.musicImage,
    ImagePathConstants.mysteryImage,
    ImagePathConstants.romanceImage,
    ImagePathConstants.scienceImage,
    ImagePathConstants.tvImage,
    ImagePathConstants.thrillerImage,
    ImagePathConstants.warImage,
    ImagePathConstants.westernImage,
  ];
  int? id;
  String? category;

  CategoryScreen({required this.resultList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Browse Category",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      id = resultList[index].id ?? "";
                      category = resultList[index].name ?? "";
                      Navigator.of(context).pushNamed(DiscoverGetApi.routeName,
                          arguments:
                              CategoryScreenArgs(id: id, category: category));
                    },
                    child: CategoryItemWidget(
                      categoryName: resultList[index].name ?? "",
                      image: imagesList[index],
                    ),
                  );
                },
                itemCount: resultList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryScreenArgs {
  int? id;
  String? category;

  CategoryScreenArgs({required this.id, required this.category});
}

// ListView.builder(
// itemCount: resultList.length,
// itemBuilder: (context, index) {
// return InkWell(
// onTap: () {
// id = resultList[index].id ?? "";
// category = resultList[index].name ?? "";
// Navigator.of(context).pushNamed(DiscoverGetApi.routeName,
// arguments: CategoryScreenArgs(id: id, category: category));
// },
// child: CategoryItemWidget(categoryName: resultList[index].name ?? ""),
// );
// },
// )
