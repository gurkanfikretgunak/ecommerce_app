import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class PopUpCubit extends Cubit<bool> {
  PopUpCubit() : super(true);

  Future<void> loadBannerPreference() async {
    final box = await Hive.openBox('settings');
    final showBanner = box.get('show_banner');
    emit(showBanner);
  }

  Future<void> changeBannerVisible(bool visible) async {
    final box = await Hive.openBox('settings');
    await box.put('show_banner', visible);
  }
}
