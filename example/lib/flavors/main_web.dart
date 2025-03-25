import 'package:example/core/network/services/auth/supabase_initialize.dart';
import 'package:example/cubits/multi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  SupabaseInitialize.initializeSupabase();

  runApp(const MultiBloc());
}
