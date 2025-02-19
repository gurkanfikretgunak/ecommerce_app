import 'package:example/pages/homepage.dart';
import 'package:example/pages/onboarding.dart';
import 'package:example/pages/signin.dart';
import 'package:example/pages/signup.dart';
import 'package:example/pages/splash.dart';
import 'package:example/pages/verification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
