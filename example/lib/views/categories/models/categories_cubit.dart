import 'package:bloc/bloc.dart';
import 'package:example/views/categories/models/categories_state.dart';
import 'package:example/core/network/respository/categorie_respository/categorie_respository.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoading());

  Future<void> loadCategories() async {
    try {
      emit(CategoriesLoading());

      final categorieRespository = CategorieRespository();

      final categories = await categorieRespository.getCategories();

      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
