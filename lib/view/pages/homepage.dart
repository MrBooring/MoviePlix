import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieflix/controllers/dashboard_controller.dart';
import '../widgets/now_showing_list.dart';
import '../widgets/top_rated_list.dart';

class Dashboard extends GetView<DashboardCotroller> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: SizedBox(
            child: SizedBox(
              // width: size.width * .8,
              child: TextFormField(
                controller: controller.searchTextController,
                style: Theme.of(context).textTheme.bodyLarge,
                onChanged: controller.filterSearchResults,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  hintText: "search",
                  icon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,

                  // errorText: controller.emailError.value.isEmpty ? null : controller.emailError.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: controller.clearSearch,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text("Clear"),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 250, 200, 92),
          selectedItemColor: Colors.black,
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Now Playing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Popular',
            ),
          ],
        ),
        body: SafeArea(
          child: controller.isLoading.value == false
              ? SizedBox(
                  child: controller.currentIndex.value == 0
                      ? NowShowingList(
                          controller: controller,
                          size: size,
                        )
                      : TopRatedList(
                          controller: controller,
                          size: size,
                        ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
