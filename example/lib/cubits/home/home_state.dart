import 'package:equatable/equatable.dart';
import 'package:example/models/product_model/product_model.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> hotDeals;
  final List<Product> newArrivals;
  final List<Product> onSale;

  HomeLoaded({
    required this.hotDeals,
    required this.newArrivals,
    required this.onSale,
  });

  @override
  List<Object?> get props => [hotDeals, newArrivals, onSale];

  HomeLoaded copyWith({
    List<Product>? hotDeals,
    List<Product>? newArrivals,
    List<Product>? onSale,
  }) {
    return HomeLoaded(
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
