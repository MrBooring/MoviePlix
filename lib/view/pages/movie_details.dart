import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movieflix/data/models/movie_model.dart';
import 'package:movieflix/utils/constants.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    MovieModel moviedetails = Get.arguments[0];
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.chevron_left,
              ),
              Text(
                "Back",
              ),
            ],
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                Constants.posterPath + moviedetails.posterPath,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: size.width * .8,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            moviedetails.originalTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Text(
                          DateFormat('MMMM d, yyyy').format(DateTime.parse(moviedetails.releaseDate)),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            moviedetails.overview,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
