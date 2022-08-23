import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/screen/home_screen.dart';

import 'bindings/movie_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MovieBindings(),
      debugShowCheckedModeBanner: false,
      locale: Locale('en', 'US'), // translations will be displayed in that locale
      home: HomeScreen(),
    );
  }
}


