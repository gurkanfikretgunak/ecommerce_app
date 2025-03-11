import 'package:bloc/bloc.dart';
import 'package:example/cubits/categories/categories_state.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoading());

  Future<void> loadCategories() async {
    try {
      emit(CategoriesLoading());

      await Future.delayed(const Duration(seconds: 1));

      final categories = [
        CategorieBanner(
            imagePath: Assets.images.categoriebannerFirst.path, text: "MEN"),
        CategorieBanner(
            imagePath: Assets.images.categoriebannerSecond.path, text: "WOMEN"),
        CategorieBanner(
            imagePath: Assets.images.categoriebannerThird.path, text: "KIDS"),
        CategorieBanner(
            imagePath: Assets.images.categoriebannerFourth.path, text: "SHOES"),
        CategorieBanner(
            imagePath: Assets.images.categoriebannerFifth.path,
            text: "ACCESSORIES"),
      ];

      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
