import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/categorie_model/categorie_model.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Categorie> categories;

  CategoriesLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];

  CategoriesLoaded copyWith({
    final List<Categorie>? categories,
  }) {
    return CategoriesLoaded(categories: categories ?? this.categories);
  }
}

class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
  @override
  List<Object?> get props => [message];
}
