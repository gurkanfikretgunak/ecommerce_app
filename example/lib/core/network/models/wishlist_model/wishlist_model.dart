import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_model.g.dart';

@JsonSerializable()
class Wishlist {
  final int? id;
  final int productId;
  final String? createdAt;
  final int userId;

  Product? product;

  Wishlist({
    this.id,
    required this.productId,
    this.createdAt,
    required this.userId,
    this.product,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json['id'],
      productId: json['product_id'],
      createdAt: json['created_at'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'user_id': userId,
    };
  }
}
