import 'package:bloc/bloc.dart';
import 'package:example/cubits/categorie_products/categorie_products_state.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/gen/assets.gen.dart';

class CategorieProductsCubit extends Cubit<CategorieProductsState> {
  CategorieProductsCubit() : super(CategorieProductsLoading());

  Future<void> loadCategorieData() async {
    try {
      emit(CategorieProductsLoading());

      await Future.delayed(const Duration(seconds: 1));

      final categoriesHeader = CategoriesHeader(
        imagePath: Assets.images.categorieheaderFirst.path,
        text: "MEN",
      );
      List<String> bottomDragItems = [
        "All Product",
        "Shirts",
        "Polos",
        "Jeans",
        "Trousers",
        "Jackets",
        "Shoes",
        "Accessories"
      ];
      final productCardItems = [
        ProductCardModal(
          imagePath: Assets.images.productcardimageFirst.path,
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00",
        ),
        ProductCardModal(
          imagePath: Assets.images.productcardimageThird.path,
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00",
        ),
        ProductCardModal(
          imagePath: Assets.images.productcardimageThird.path,
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00",
        ),
        ProductCardModal(
          imagePath: Assets.images.productcardimageThird.path,
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00",
        ),
        ProductCardModal(
          imagePath: Assets.images.productcardimageThird.path,
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00",
        ),
        ProductCardModal(
          imagePath: Assets.images.productcardimageThird.path,
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00",
        ),
      ];
      emit(CategorieProductsLoaded(
          categoriesHeader: categoriesHeader,
          products: productCardItems,
          bottomDragItems: bottomDragItems));
    } catch (e) {
      emit(CategorieProductsError(e.toString()));
    }
  }
}
