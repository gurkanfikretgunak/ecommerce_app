import 'package:bloc/bloc.dart';
import 'package:example/core/network/repository/categorie_repository/categorie_repository.dart';
import 'package:example/core/cubits/categories/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoading());

  Future<void> loadCategories() async {
    try {
      emit(CategoriesLoading());

      final categorieRepository = CategorieRepository();

      final categories = await categorieRepository.getCategories();

      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
