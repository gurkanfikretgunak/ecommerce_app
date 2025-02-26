import 'package:example/pages/newaddress.dart';
import 'package:example/pages/newcard.dart';
import 'package:example/widgets/ordersuccess.dart';
import 'package:example/pages/payment.dart';
import 'package:example/pages/categorie_products.dart';
import 'package:example/pages/homepage.dart';
import 'package:example/pages/onboarding.dart';
import 'package:example/pages/paymentmethods.dart';
import 'package:example/pages/product.dart';
import 'package:example/pages/signin.dart';
import 'package:example/pages/signup.dart';
import 'package:example/pages/splash.dart';
import 'package:example/pages/verification.dart';
import 'package:example/pages/categories.dart';
import 'package:example/widgets/cart.dart';
import 'package:example/widgets/checkout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ExampleApp(),
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
        home: Payment());
  }
}
