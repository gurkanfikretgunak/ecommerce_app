import 'package:equatable/equatable.dart';
import 'package:example/core/widgets/wishlist.dart';

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
