import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

abstract class CategorieProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategorieProductsLoading extends CategorieProductsState {}

class CategorieProductsLoaded extends CategorieProductsState {
  final List<Product> products;

  CategorieProductsLoaded({required this.products});

  @override
  List<Object?> get props => [products];

  CategorieProductsLoaded copyWith({
    List<Product>? products,
  }) {
    return CategorieProductsLoaded(
      products: products ?? this.products,
    );
  }
}

class CategorieProductsError extends CategorieProductsState {
  final String message;
  CategorieProductsError(this.message);

  @override
  List<Object?> get props => [message];
}
