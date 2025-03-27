import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class Cart {
  final int? id;
  final String? createdId;
  final String userId;
  final int productId;
  final String size;
  final String color;

  int quantity;
  double unitPrice;
  double? totalPrice;
  Product? product;

  Cart({
    this.id,
    this.createdId,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.size,
    required this.color,
    this.totalPrice,
    this.product,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      createdId: json['created_id'],
      userId: json['user_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      unitPrice: (json['unit_price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      size: json['size'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'product_id': productId,
      'quantity': quantity,
      'unit_price': unitPrice,
      'size': size,
      'color': color,
    };
  }
}
