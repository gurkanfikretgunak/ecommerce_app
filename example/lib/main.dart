import 'package:device_preview/device_preview.dart';
import 'package:example/pages/account/account_view.dart';
import 'package:example/pages/home/home_view.dart';
import 'package:example/pages/search/search_view.dart';
import 'package:example/pages/signin/signin_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  // await dotenv.load();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const ExampleApp(),
  ));
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Example App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignInView());
  }
}
