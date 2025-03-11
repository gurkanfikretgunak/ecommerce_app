import 'package:equatable/equatable.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategorieProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategorieProductLoading extends CategorieProductsState {}

class CategorieProductLoaded extends CategorieProductsState {
  final List<ProductCardModal> products;

  CategorieProductLoaded({required this.products});

  @override
  List<Object?> get props => [products];

  CategorieProductLoaded copyWith({
    List<ProductCardModal>? products,
  }) {
    return CategorieProductLoaded(products: products ?? this.products);
  }
}

class CategorieProductError extends CategorieProductsState {
  final String message;
  CategorieProductError(this.message);

  @override
  List<Object?> get props => [message];
}
