import 'package:bloc/bloc.dart';
import 'package:example/cubits/home/home_state.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  Future<void> loadHomeData() async {
    try {
      emit(HomeLoading());

      await Future.delayed(const Duration(seconds: 1));

      final categories = [
        ImageRadiusModal(
            imagePath: Assets.images.categorierowFirst.path, text: "Men"),
        ImageRadiusModal(
            imagePath: Assets.images.categorierowSecond.path, text: "Women"),
        ImageRadiusModal(
            imagePath: Assets.images.categorierowThird.path, text: "Kids"),
        ImageRadiusModal(
            imagePath: Assets.images.categorierowFourth.path, text: "Bags"),
        ImageRadiusModal(
            imagePath: Assets.images.categorierowFifth.path, text: "Shoes"),
        ImageRadiusModal(
            imagePath: Assets.images.categorierowSix.path, text: "Accessories"),
      ];

      final hotDeals = [
        ProductCardModal(
            imagePath: Assets.images.productcardimageFirst.path,
            productStock: "Sold(50 Product)",
            productName: "Long-sleeved T-shirt",
            productPrice: "\$49.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageSecond.path,
            productStock: "Sold(50 Product)",
            productName: "Printed Cotton Shirt",
            productPrice: "\$45.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageThird.path,
            productStock: "Sold(50 Product)",
            productName: "Cotton T-shirt",
            productPrice: "\$49.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageFourth.path,
            productStock: "Sold(50 Product)",
            productName: "Embroidered T-Shirt",
            productPrice: "\$39.00"),
      ];

      final newArrivals = [
        ProductCardModal(
            imagePath: Assets.images.productcardimageFirst.path,
            productStock: "Sold(50 Product)",
            productName: "Long-sleeved T-shirt",
            productPrice: "\$49.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageSecond.path,
            productStock: "Sold(50 Product)",
            productName: "Printed Cotton Shirt",
            productPrice: "\$45.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageThird.path,
            productStock: "Sold(50 Product)",
            productName: "Cotton T-shirt",
            productPrice: "\$49.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageFourth.path,
            productStock: "Sold(50 Product)",
            productName: "Embroidered T-Shirt",
            productPrice: "\$39.00"),
      ];
      final onSale = [
        ProductCardModal(
            imagePath: Assets.images.productcardimageFirst.path,
            productStock: "Sold(50 Product)",
            productName: "Long-sleeved T-shirt",
            productPrice: "\$49.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageSecond.path,
            productStock: "Sold(50 Product)",
            productName: "Printed Cotton Shirt",
            productPrice: "\$45.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageThird.path,
            productStock: "Sold(50 Product)",
            productName: "Cotton T-shirt",
            productPrice: "\$49.00"),
        ProductCardModal(
            imagePath: Assets.images.productcardimageFourth.path,
            productStock: "Sold(50 Product)",
            productName: "Embroidered T-Shirt",
            productPrice: "\$39.00"),
      ];

      emit(HomeLoaded(
          categories: categories,
          hotDeals: hotDeals,
          newArrivals: newArrivals,
          onSale: onSale));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
