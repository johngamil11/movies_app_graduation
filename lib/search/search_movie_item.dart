import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_team/api/api_manager.dart';
import 'package:movies_app_team/colors.dart';
import 'package:movies_app_team/model/search_model.dart';

class SearchMovieItem extends StatefulWidget {
  @override
  State<SearchMovieItem> createState() => _SearchMovieItemState();
}

class _SearchMovieItemState extends State<SearchMovieItem> {
  TextEditingController searchControllers = TextEditingController();

  ApiManager apiManager = ApiManager();

  SearchModel? searchModel;

  void search(String query) {
    apiManager.getSearchMovie(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void dispose() {
    searchControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            if (value.isEmpty) {
            } else {
              search(searchControllers.text);
            }
          },
          controller: searchControllers,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: const TextStyle(color: AppColor.whiteColor),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColor.whiteColor,
            ),
            filled: true,
            fillColor: AppColor.greyColor.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        searchModel == null
            ? const SizedBox.shrink()
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              width: width * 0.4,
                              height: height * 0.12,
                              child: searchModel!.results[index].backdropPath ==
                                      null
                                  ? Image.asset(
                                      'assets/images/Frame 1.png',
                                      fit: BoxFit.fill,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/w500${searchModel!.results[index].backdropPath}",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * 0.5,
                                    child: Text(
                                      searchModel!.results[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: AppColor.whiteColor),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                      searchModel!.results[index].releaseDate
                                          .toString()
                                          .substring(0, 4),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: AppColor.whiteColor))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: height * .03, // Width of the divider
                          thickness: 3, // Thickness of the divider
                          color: Colors.white, // Color of the divider
                        ),
                      ],
                    );
                  },
                  itemCount: searchModel!.results.length,
                ),
              ),
      ],
    );
  }
}
