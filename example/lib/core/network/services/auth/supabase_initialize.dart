import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseInitialize {
  static Future<void> initializeSupabase() async {
    try {
      await Supabase.initialize(
          url: dotenv.env['SUPABASE_URL']!,
          anonKey: dotenv.env['SUPABASE_KEY']!);
    } catch (e) {
      rethrow;
    }
  }

  static SupabaseClient get client => Supabase.instance.client;
}
