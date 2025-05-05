import 'dart:io';

import 'package:example/cubits/locale/locale_cubit.dart';
import 'package:example/cubits/multi_bloc.dart';
import 'package:example/flavor.dart';
import 'package:example/l10n/app_l10n.dart';
import 'package:example/route/route.dart';
import 'package:example/core/network/services/auth/supabase_initialize.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: depend_on_referenced_packages
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  SupabaseInitialize.initializeSupabase();
  if (!kIsWeb) {
    await Firebase.initializeApp();
    await Hive.initFlutter();
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize(dotenv.env['ONESIGNAL_APP_ID'] ?? "");
    OneSignal.Notifications.requestPermission(true);
  }

  AppConfig(appName: "My App - Prod", flavor: Flavor.production);
  runApp(const MultiBloc());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          useInheritedMediaQuery: true,
          locale: locale,
          title: 'Example App',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: ColorConstant.instance.neutral9,
            ),
            useMaterial3: true,
          ),
          routerConfig: AppRouter().config(),
        );
      },
    );
  }
}
