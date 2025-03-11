import 'package:equatable/equatable.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategoriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategorieBanner> categories;

  CategoriesLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];

  CategoriesLoaded copyWith({
    final List<CategorieBanner>? categories,
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
