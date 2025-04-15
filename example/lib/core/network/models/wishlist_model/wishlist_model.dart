import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_model.g.dart';

@JsonSerializable()
class Wishlist {
  final int? id;
  final String? created_at;
  final int product_id;
  final String user_id;
  final List<String> sizes;
  final List<String> colors;

  Product? product;

  Wishlist({
    this.id,
    required this.product_id,
    this.created_at,
    required this.user_id,
    this.product,
    required this.sizes,
    required this.colors,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json['id'],
      created_at: json['created_at'],
      user_id: json['user_id'],
      product_id: json['product_id'],
      sizes: List<String>.from(json['sizes']),
      colors: List<String>.from(json['colors']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': product_id,
      'user_id': user_id,
      'sizes': sizes,
      'colors': colors,
    };
  }
}
