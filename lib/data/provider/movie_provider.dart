import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:movieflix/data/models/movie_model.dart';
import 'package:movieflix/utils/constants.dart';

class ApiServices extends GetConnect {
  Future<List<MovieModel>?> getNowPlayingMovies(int page, String lang) async {
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
      log("getNowPlayingMovies => ${e}");
      return null;
    }
  }

  Future<List<MovieModel>?> getTopRatedMovies() async {
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
      log("getTopRatedMovies => ${e}");
      return null;
    }
  }
}
