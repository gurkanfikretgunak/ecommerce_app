import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')) {
    loadLanguage();
  }

  void changeLocale(Locale locale) async {
    await saveLanguage(locale.languageCode);
    emit(locale);
  }

  Future<void> loadLanguage() async {
    final box = await Hive.openBox('settings');
    final savedLanguage = box.get('language', defaultValue: 'en');
    emit(Locale(savedLanguage));
  }

  Future<void> saveLanguage(String language) async {
    final box = await Hive.openBox('settings');
    await box.put('language', language);
  }
}
