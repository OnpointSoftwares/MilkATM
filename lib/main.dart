import 'package:flutter/material.dart';
import 'package:manhole_manager/login.dart';
import 'package:manhole_manager/Home.dart';
void main() {
  runApp(const FibreOpticsApp());
}

class FibreOpticsApp extends StatelessWidget {
  const FibreOpticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue[300],
          scaffoldBackgroundColor: Colors.white,
       backgroundColor: Colors.white,
          bottomAppBarColor: Colors.blueAccent,
        ),
        home: const LoginScreen(),
        routes: {
          'login': (context) => LoginScreen(),
          'home':(context) => AdminHomeScreen(),
        });
  }
}

