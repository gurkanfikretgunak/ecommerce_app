import 'package:bloc/bloc.dart';
import 'package:example/cubits/product/product_state.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());

  Future<void> loadProductData() async {
    try {
      emit(ProductLoading());

      await Future.delayed(const Duration(seconds: 1));

      final imagePaths = [
        Assets.images.productheaderimageFirst.path,
        Assets.images.productheaderimageFirst.path,
        Assets.images.productheaderimageFirst.path,
      ];

      final productCardItems = [
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

      final reviewItems = [
        const ProductReviewModal(
            name: "Theresa Webb",
            rate: 5,
            date: "May1,2022",
            reviewText:
                "Cursus sit amet dictum sit amet justo donec enim. Commodo ullamcorper a lacus",
            imagePath: "assets/images/categorierow_first.png"),
        const ProductReviewModal(
            name: "Theresa Webb",
            rate: 3,
            date: "May1,2022",
            reviewText:
                "Cursus sit amet dictum sit amet justo donec enim. Commodo ullamcorper a lacus",
            imagePath: "assets/images/categorierow_first.png"),
      ];

      final sizes = ["S", "M", "L", "XL"];
      final colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];

      const rating = "4,9";
      const reviewCount = "12";
      const soldCount = "50";
      const productName = "Printed cotton shirt";
      const description =
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lectus urna duis convallis convallis tellus.";

      const productDescriptionText =
          "Purus in massa tempor nec feugiat. Congue nisi vitae suscipit tellus mauris a diam. Nam aliquam sem et tortor. Quis risus sed vulputate odio ut enim. Ultrices dui sapien eget mi proin sed libero enim sed. Quis viverra nibh cras pulvinar mattis nunc sed blandit libero. At volutpat diam ut venenatis tellus in";
      const productDescriptionImagePath =
          "assets/images/productdescriptionimage.png";

      emit(ProductLoaded(
        imagePaths: imagePaths,
        productCardItems: productCardItems,
        reviewItems: reviewItems,
        sizes: sizes,
        colors: colors,
        rating: rating,
        reviewCount: reviewCount,
        soldCount: soldCount,
        productName: productName,
        description: description,
        productDescriptionText: productDescriptionText,
        productDescriptionImagePath: productDescriptionImagePath,
      ));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
