import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<String> imagePaths;
  final List<Widget> productCardItems;
  final List<Widget> reviewItems;
  final List<String> sizes;
  final List<Color> colors;
  final String rating;
  final String reviewCount;
  final String soldCount;
  final String productName;
  final String description;
  final String productDescriptionText;
  final String productDescriptionImagePath;
  final Color selectedColor;

  ProductLoaded({
    required this.imagePaths,
    required this.productCardItems,
    required this.reviewItems,
    required this.sizes,
    required this.colors,
    required this.rating,
    required this.reviewCount,
    required this.soldCount,
    required this.productName,
    required this.description,
    required this.productDescriptionText,
    required this.productDescriptionImagePath,
    required this.selectedColor,
  });

  @override
  List<Object?> get props => [
        imagePaths,
        productCardItems,
        reviewItems,
        sizes,
        colors,
        rating,
        reviewCount,
        soldCount,
        productName,
        description,
        productDescriptionText,
        productDescriptionImagePath,
        selectedColor,
      ];

  ProductLoaded copyWith({
    List<String>? imagePaths,
    List<Widget>? productCardItems,
    List<Widget>? reviewItems,
    List<String>? sizes,
    List<Color>? colors,
    String? rating,
    String? reviewCount,
    String? soldCount,
    String? productName,
    String? description,
    String? productDescriptionText,
    String? productDescriptionImagePath,
    Color? selectedColor,
  }) {
    return ProductLoaded(
      imagePaths: imagePaths ?? this.imagePaths,
      productCardItems: productCardItems ?? this.productCardItems,
      reviewItems: reviewItems ?? this.reviewItems,
      sizes: sizes ?? this.sizes,
      colors: colors ?? this.colors,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      soldCount: soldCount ?? this.soldCount,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      productDescriptionText:
          productDescriptionText ?? this.productDescriptionText,
      productDescriptionImagePath:
          productDescriptionImagePath ?? this.productDescriptionImagePath,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
