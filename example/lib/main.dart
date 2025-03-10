// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
import 'package:example/cubits/multi_bloc.dart';
import 'package:example/pages/home/home_view.dart';
import 'package:example/pages/splash/splash_view.dart';
import 'package:example/route/route.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: depend_on_referenced_packages
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(dotenv.env['ONESIGNAL_APP_ID'] ?? "");
  OneSignal.Notifications.requestPermission(true);
  runApp(const ExampleApp() /*MultiBloc()*/);
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      //locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Example App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstant.instance.neutral9),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().config(),
    );
  }
}
