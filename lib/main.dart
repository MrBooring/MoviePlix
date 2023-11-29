import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData.light().copyWith(
      //   textTheme: TextTheme().copyWith(
      //       titleLarge: TextStyle(
      //           fontFamily: 'Montserrat',
      //           fontSize: MediaQuery.of(context).textScaleFactor * 30,
      //           color: Theme.of(context).colorScheme.primary,
      //           fontWeight: FontWeight.w700),
      //       titleMedium: TextStyle(
      //           fontFamily: 'Montserrat',
      //           fontSize: MediaQuery.of(context).textScaleFactor * 20,
      //           color: Theme.of(context).colorScheme.primary,
      //           fontWeight: FontWeight.w700),
      //       bodyLarge: TextStyle(fontFamily: 'Montserrat', fontSize: MediaQuery.of(context).textScaleFactor * 20),
      //       labelMedium: TextStyle(
      //           fontFamily: 'Montserrat',
      //           fontSize: MediaQuery.of(context).textScaleFactor * 18,
      //           color: Theme.of(context).colorScheme.primary,
      //           fontWeight: FontWeight.w700),
      //       bodyMedium: TextStyle(
      //         fontFamily: 'Montserrat',
      //         color: Theme.of(context).colorScheme.primary,
      //       ),
      //       labelLarge: TextStyle(
      //         fontFamily: 'Montserrat',
      //         color: Theme.of(context).colorScheme.primary,
      //       ),
      //       headlineMedium: TextStyle(
      //         fontFamily: 'Montserrat',
      //         color: Theme.of(context).colorScheme.primary,
      //       ),
      //       titleSmall: TextStyle(
      //         fontFamily: 'Montserrat',
      //         color: Theme.of(context).colorScheme.primary,
      //       )
      //       //lablelarge
      //       //headline medium
      //       ),
      //   primaryColorLight: Color(0xFFEEf3FA),
      //   scaffoldBackgroundColor: Color(0xFFEEf3FA),
      //   colorScheme: ColorScheme(
      //     brightness: Brightness.light,
      //     primary: Color(0xFF00BFE5),
      //     onPrimary: Color.fromARGB(255, 36, 203, 236),
      //     secondary: Color(0xFFA1DCE7),
      //     onSecondary: Color(0xFFBDE6EE),
      //     error: Color(0xFFff3333),
      //     onError: Color(0xFFA30000), // Dark red color for error messages
      //     background: Color(0xFFF2F2F2), // Light gray background
      //     onBackground: Color(0xFF000000), // Black text on light gray background
      //     surface: Color(0xFFFFFFFF), // White surface
      //     onSurface: Color(0xFF333333), // Dark gray text on white surface
      //   ),
      // ),

      theme: Theme.of(context).copyWith(
        useMaterial3: true,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color.fromARGB(255, 243, 183, 52),
              onPrimary: Colors.black,
              brightness: Brightness.light,
            ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 183, 52),
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: const Color.fromARGB(255, 250, 200, 92),
        ),
        textTheme: const TextTheme().copyWith(
          titleMedium: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
          labelMedium: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          bodyLarge: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: AppRoutes.routes,
    );
  }
}
