import 'package:bloc/bloc.dart';
import 'package:example/cubits/categories/categories_state.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/respository/categorie_respository/categorie_respository.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoading());

  Future<void> loadCategories() async {
    try {
      emit(CategoriesLoading());

      await Future.delayed(const Duration(seconds: 1));

      final categorieRespository = CategorieRespository();

      final categories = await categorieRespository.getCategories();

      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
