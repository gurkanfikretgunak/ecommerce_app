import 'package:equatable/equatable.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategorieProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategorieProductsLoading extends CategorieProductsState {}

class CategorieProductsLoaded extends CategorieProductsState {
  final CategoriesHeader categoriesHeader;
  final List<String> bottomDragItems;
  final List<ProductCardModal> products;

  CategorieProductsLoaded(
      {required this.categoriesHeader,
      required this.bottomDragItems,
      required this.products});

  @override
  List<Object?> get props => [categoriesHeader, products];

  CategorieProductsLoaded copyWith({
    CategoriesHeader? categoriesHeader,
    List<String>? bottomDragItems,
    List<ProductCardModal>? products,
  }) {
    return CategorieProductsLoaded(
      categoriesHeader: categoriesHeader ?? this.categoriesHeader,
      bottomDragItems: bottomDragItems ?? this.bottomDragItems,
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
