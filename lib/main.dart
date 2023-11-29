import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/services/services_locator.dart';
import 'package:movie_app/movies/presentation/views/home_movie_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  ServicesLocator().initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.alexandriaTextTheme(ThemeData.dark().textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeMovieView(),
    );
  }
}
