import 'package:bloc/bloc.dart';
import 'package:example/views/categorie_products/models/categorie_products_state.dart';
import 'package:example/core/network/respository/product_respository/product_respository.dart';

class CategorieProductsCubit extends Cubit<CategorieProductsState> {
  CategorieProductsCubit() : super(CategorieProductsLoading());

  Future<void> loadCategorieData({required String id, String? tag}) async {
    try {
      emit(CategorieProductsLoading());

      final products = await ProductRespository().getProducts(
        tag: tag,
        categorieId: id,
      );
      emit(CategorieProductsLoaded(products: products));
    } catch (e) {
      emit(CategorieProductsError(e.toString()));
    }
  }
}
