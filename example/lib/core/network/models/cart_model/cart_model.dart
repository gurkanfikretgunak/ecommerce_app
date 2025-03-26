import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class Cart {
  final int? id;
  final String? createdId;
  final String userId;
  final int productId;
  final String productImage;
  final String productName;
  int quantity;
  double unitPrice;
  double? totalPrice;
  Product? product;

  Cart({
    this.id,
    this.createdId,
    required this.userId,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    this.totalPrice,
    this.product,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      createdId: json['created_id'],
      userId: json['user_id'],
      productId: json['product_id'],
      productImage: json['product_image'],
      productName: json['product_name'],
      quantity: json['quantity'],
      unitPrice: (json['unit_price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'product_id': productId,
      'product_image': productImage,
      'product_name': productName,
      'quantity': quantity,
      'unit_price': unitPrice,
    };
  }
}
