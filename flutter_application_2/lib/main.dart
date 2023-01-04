import 'package:flutter/material.dart';
import 'package:flutter_application_2/AgentsScreen.dart';
import 'package:flutter_application_2/GuideScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          shape: StadiumBorder(),
          elevation: 0,
          backgroundColor: Color.fromARGB(177, 19, 19, 22),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(128, 35, 59, 85),
      ),
      home: const GuidePage(),
    );
  }
}
