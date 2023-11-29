import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:movieflix/data/models/movie_model.dart';
import 'package:movieflix/utils/constants.dart';

class ApiServices extends GetConnect {
  Future<List<MovieModel>?> getNowPlayingMovies(int page, String lang) async {
    const maxRetries = 3;

    for (int retryCount = 0; retryCount < maxRetries; retryCount++) {
      try {
        Response response = await get(
          "${Constants.serverUrl}now_playing",
          query: {
            'language': lang,
            'page': "$page",
            'api_key': Constants.apiKey,
          },
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          return moviesFromJson(response.bodyString.toString());
        } else {
          Get.snackbar("Error code ${response.statusCode}", response.statusText.toString());
          return null;
        }
      } catch (e) {
        if (kDebugMode) {
          print("exception =>${e.toString()}");
        }
        if (retryCount == maxRetries - 1) {
          Get.snackbar("Error", "Failed after $maxRetries attempts. ${e.toString()}");
          return null;
        } else {
          await Future.delayed(const Duration(seconds: 5));
        }
      }
    }
    return null;
  }

  Future<List<MovieModel>?> getTopRatedMovies() async {
    const maxRetries = 3;

    for (int retryCount = 0; retryCount < maxRetries; retryCount++) {
      try {
        Response response = await get(
          "${Constants.serverUrl}top_rated",
          query: {
            'api_key': Constants.apiKey,
          },
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          return moviesFromJson(response.bodyString.toString());
        } else {
          Get.snackbar("Error code ${response.statusCode}", response.statusText.toString());
          return null;
        }
      } catch (e) {
        if (kDebugMode) {
          print("exception =>${e.toString()}");
        }
        if (retryCount == maxRetries - 1) {
          Get.snackbar("Error", "Failed after $maxRetries attempts. ${e.toString()}");
          return null;
        } else {
          await Future.delayed(const Duration(seconds: 5));
        }
      }
    }
    return null;
  }
}
