import 'package:equatable/equatable.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ImageRadiusModal> categories;
  final List<ProductCardModal> hotDeals;
  final List<ProductCardModal> newArrivals;
  final List<ProductCardModal> onSale;

  HomeLoaded({
    required this.categories,
    required this.hotDeals,
    required this.newArrivals,
    required this.onSale,
  });

  @override
  List<Object?> get props => [categories, hotDeals, newArrivals, onSale];

  HomeLoaded copyWith({
    List<ImageRadiusModal>? categories,
    List<ProductCardModal>? hotDeals,
    List<ProductCardModal>? newArrivals,
    List<ProductCardModal>? onSale,
  }) {
    return HomeLoaded(
      categories: categories ?? this.categories,
      hotDeals: hotDeals ?? this.hotDeals,
      newArrivals: newArrivals ?? this.newArrivals,
      onSale: onSale ?? this.onSale,
    );
  }
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
