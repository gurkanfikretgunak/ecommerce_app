import 'package:bloc/bloc.dart';
import 'package:example/cubits/categorie_products/categorie_products_state.dart';
import 'package:example/respository/product_respository/product_respository.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/gen/assets.gen.dart';

class CategorieProductsCubit extends Cubit<CategorieProductsState> {
  CategorieProductsCubit() : super(CategorieProductsLoading());

  Future<void> loadCategorieData(String id) async {
    try {
      emit(CategorieProductsLoading());

      final products = await ProductRespository().getProducts(categorieId: id);
      emit(CategorieProductsLoaded(products: products));
    } catch (e) {
      emit(CategorieProductsError(e.toString()));
    }
  }
}
