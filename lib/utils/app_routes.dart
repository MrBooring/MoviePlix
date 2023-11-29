import 'package:get/get.dart';
import 'package:movieflix/binders/dashboard_binder.dart';
import 'package:movieflix/view/pages/homepage.dart';
import 'package:movieflix/view/pages/movie_details.dart';
import 'package:movieflix/view/pages/splash_screen.dart';

class AppRoutes {
  static final List<GetPage> _routes = [
    GetPage(
      name: "/",
      page: () => const SplashScreen(),
      binding: DashboardBinder(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: "/dashboard",
      page: () => const Dashboard(),
      binding: DashboardBinder(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: "/moviedetails",
      page: () => const MovieDetails(),
      binding: DashboardBinder(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];

  static List<GetPage> get routes => List.unmodifiable(_routes);
}
