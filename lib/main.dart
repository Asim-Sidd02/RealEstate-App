import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reales/welcompage.dart';
import 'package:reales/signup.dart';

import 'login.dart';




void main() async {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => const SignupPage(),

      },
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const WelcomePage(),
    );
  }
}
