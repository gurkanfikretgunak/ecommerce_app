import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/wishlist_model/wishlist_model.dart';

abstract class WishlistState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<Wishlist> wishlist;

  WishlistLoaded(this.wishlist);

  @override
  List<Object?> get props => [wishlist];
}

class WishlistChangeFavorite extends WishlistState {
  final bool isFavorite;

  WishlistChangeFavorite(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}

class WishlistIsFavorite extends WishlistState {
  final bool isFavorite;

  WishlistIsFavorite(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}

class WishlistSuccess extends WishlistState {
  final String message;

  WishlistSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError(this.message);

  @override
  List<Object?> get props => [message];
}
