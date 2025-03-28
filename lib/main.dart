import 'dart:async';
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'user_id_splash_screen.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scavanger Hunt!',
      theme: ThemeData(fontFamily: 'Proxima Nova'),
      home: SplashScreen(),
    );
  }
}
