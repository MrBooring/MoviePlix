import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:movieflix/controllers/dashboard_controller.dart';
import 'package:movieflix/data/models/movie_model.dart';
import 'package:movieflix/utils/constants.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({
    super.key,
    required this.controller,
    required this.size,
  });

  final DashboardCotroller controller;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator.adaptive(
        onRefresh: () => controller.getTopRatedMovies(),
        child: controller.topRatedFilteredList.isEmpty
            ? ListView.builder(
                itemCount: controller.topRated.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    key: ObjectKey(controller.topRated[index]),
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          title: "delete",
                          onTap: (CompletionHandler handler) async {
                            await handler(true);
                            controller.deleteFromTopRated(controller.topRated[index].id);
                          },
                          color: Colors.red),
                    ],
                    child: GestureDetector(
                      onTap: () {
                        MovieModel moviedetails = controller.topRated[index];
                        Get.toNamed("/moviedetails", arguments: [moviedetails]);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .15,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: size.height * .15,
                                    width: size.width * .2,
                                    child: Image.network(
                                      Constants.posterPath + controller.topRated[index].posterPath,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.topRated[index].title,
                                            style: Theme.of(context).textTheme.titleMedium!,
                                          ),
                                          Text(
                                            controller.topRated[index].overview,
                                            style: Theme.of(context).textTheme.labelMedium,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: .5,
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: controller.topRatedFilteredList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    key: ObjectKey(controller.topRatedFilteredList[index]),
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          title: "delete",
                          onTap: (CompletionHandler handler) async {
                            await handler(true);
                            controller.deleteFromTopRated(controller.topRatedFilteredList[index].id);
                          },
                          color: Colors.red),
                    ],
                    child: GestureDetector(
                      onTap: () {
                        MovieModel moviedetails = controller.topRatedFilteredList[index];
                        Get.toNamed("/moviedetails", arguments: [moviedetails]);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .15,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: size.height * .15,
                                    width: size.width * .2,
                                    child: Image.network(
                                      Constants.posterPath + controller.topRatedFilteredList[index].posterPath,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.topRatedFilteredList[index].title,
                                            style: Theme.of(context).textTheme.titleMedium!,
                                          ),
                                          Text(
                                            controller.topRatedFilteredList[index].overview,
                                            style: Theme.of(context).textTheme.labelMedium,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: .5,
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
