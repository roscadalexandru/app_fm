import 'package:app_fm/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const MaterialColor black = MaterialColor(
    0xff12122b,
    <int, Color>{
      50: Color(0xff12122b),
      100: Color(0xff12122b),
      200: Color(0xff12122b),
      300: Color(0xff12122b),
      400: Color(0xff12122b),
      500: Color(0xff12122b),
      600: Color(0xff12122b),
      700: Color(0xff12122b),
      800: Color(0xff12122b),
      900: Color(0xFF12122B),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: black,
        fontFamily: GoogleFonts.signika().fontFamily,
      ),
      onGenerateRoute: AppRouter.generateRoutes,
      initialRoute: '/home',
    );
  }
}
