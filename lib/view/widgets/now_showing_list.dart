import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:movieflix/controllers/dashboard_controller.dart';
import 'package:movieflix/data/models/movie_model.dart';
import 'package:movieflix/utils/constants.dart';

class NowShowingList extends StatelessWidget {
  const NowShowingList({
    super.key,
    required this.controller,
    required this.size,
  });

  final Size size;
  final DashboardCotroller controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator.adaptive(
        onRefresh: () => controller.getNowShowingMovies(),
        child: controller.nowShowingFilteredList.isEmpty
            ? ListView.builder(
                itemCount: controller.nowShowing.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    key: ObjectKey(controller.nowShowing[index]),
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          title: "delete",
                          onTap: (CompletionHandler handler) async {
                            await handler(true);
                            controller.deleteFromNowShowing(controller.nowShowing[index].id);
                          },
                          color: Colors.red),
                    ],
                    child: GestureDetector(
                      onTap: () {
                        MovieModel moviedetails = controller.nowShowing[index];
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
                                      Constants.posterPath + controller.nowShowing[index].posterPath,
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
                                            controller.nowShowing[index].title,
                                            style: Theme.of(context).textTheme.titleMedium!,
                                          ),
                                          Text(
                                            controller.nowShowing[index].overview,
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
                itemCount: controller.nowShowingFilteredList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SwipeActionCell(
                    key: ObjectKey(controller.nowShowingFilteredList[index]),

                    /// this key is necessary
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          title: "delete",
                          onTap: (CompletionHandler handler) async {
                            await handler(true);
                            controller.deleteFromNowShowing(controller.nowShowingFilteredList[index].id);
                          },
                          color: Colors.red),
                    ],
                    child: GestureDetector(
                      onTap: () {
                        MovieModel moviedetails = controller.nowShowingFilteredList[index];
                        Get.toNamed("/moviedetails", arguments: [moviedetails]);
                      },
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.grey,
                            thickness: .5,
                            height: 10,
                          ),
                          GestureDetector(
                            child: SizedBox(
                              height: size.height * .15,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: size.height * .15,
                                      width: size.width * .2,
                                      child: Image.network(
                                        Constants.posterPath + controller.nowShowingFilteredList[index].posterPath,
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
                                              controller.nowShowingFilteredList[index].title,
                                              style: Theme.of(context).textTheme.titleMedium!,
                                            ),
                                            Text(
                                              controller.nowShowingFilteredList[index].overview,
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
