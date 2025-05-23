import 'package:example/core/cubits/locale/locale_cubit.dart';
import 'package:example/core/cubits/multi_bloc.dart';
import 'package:example/app/l10n/app_l10n.dart';
import 'package:example/app/route/route.dart';
import 'package:example/core/network/services/auth/supabase_initialize.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

import 'package:slang_flutter/slang_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  SupabaseInitialize.initializeSupabase();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(dotenv.env['ONESIGNAL_APP_ID'] ?? "");
  OneSignal.Notifications.requestPermission(true);
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
