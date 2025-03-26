import 'package:example/cubits/multi_bloc.dart';
import 'package:example/flavor.dart';
import 'package:example/route/route.dart';
import 'package:example/core/network/services/auth/supabase_initialize.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: depend_on_referenced_packages
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  SupabaseInitialize.initializeSupabase();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(dotenv.env['ONESIGNAL_APP_ID'] ?? "");
  OneSignal.Notifications.requestPermission(true);
  AppConfig(appName: "My App - Prod", flavor: Flavor.production);
  runApp(const MultiBloc());
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
