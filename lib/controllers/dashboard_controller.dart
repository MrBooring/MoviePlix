import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieflix/data/models/movie_model.dart';
import 'package:movieflix/data/provider/movie_provider.dart';

class DashboardCotroller extends GetxController {
  var isLoading = false.obs;
  var currentIndex = 0.obs;

  var nowShowing = <MovieModel>[].obs;
  var topRated = <MovieModel>[].obs;

  var nowShowingFilteredList = <MovieModel>[].obs;
  var topRatedFilteredList = <MovieModel>[].obs;

  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() async {
    await getNowShowingMovies();
    await getTopRatedMovies();
    super.onInit();
  }

  void filterSearchResults(String query) {
    if (query == "") {
      clearSearch();
    } else {
      List<MovieModel> nowShowingResults =
          nowShowing.where((movie) => movie.title.toLowerCase().contains(query.toLowerCase())).toList();

      List<MovieModel> topRatedResults =
          topRated.where((movie) => movie.title.toLowerCase().contains(query.toLowerCase())).toList();

      nowShowingFilteredList.value = nowShowingResults;
      topRatedFilteredList.value = topRatedResults;
    }
  }

  void clearSearch() {
    searchTextController.clear();
    nowShowingFilteredList.clear();
    topRatedFilteredList.clear();
  }

  deleteFromNowShowing(id) {
    nowShowing.removeWhere((movie) => movie.id == id);
    nowShowingFilteredList.removeWhere((movie) => movie.id == id);
  }

  deleteFromTopRated(id) {
    topRated.removeWhere((movie) => movie.id == id);
    topRatedFilteredList.removeWhere((movie) => movie.id == id);
  }

  getNowShowingMovies() async {
    isLoading.value = true;
    await ApiServices().getNowPlayingMovies(1, "en_US").then((value) {
      if (value != null) {
        nowShowing.value = value;
        isLoading.value = false;
      }
    });
  }

  getTopRatedMovies() async {
    isLoading.value = true;
    await ApiServices().getTopRatedMovies().then((value) {
      if (value != null) {
        topRated.value = value;
        isLoading.value = false;
      }
    });
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }
}
