import 'package:flutter/material.dart';
import 'package:flutter_application_2/GuideScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with _Utilites {
  MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          shape: const StadiumBorder(),
          elevation: 0,
          backgroundColor: _Utilites().appBarBack,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: _Utilites().scaffoldback,
      ),
      home: const GuidePage(),
    );
  }
}

class _Utilites {
  final Color appBarBack = const Color.fromARGB(177, 19, 19, 22);
  final Color scaffoldback = const Color.fromARGB(255, 19, 31, 45);
}
