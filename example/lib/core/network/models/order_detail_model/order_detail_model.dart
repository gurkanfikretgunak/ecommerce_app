import 'package:json_annotation/json_annotation.dart';

part 'order_detail_model.g.dart';

@JsonSerializable()
class OrderDetail {
  final int id;
  final String created_at;
  final int order_id;
  final int product_id;
  final int quantity;
  final double unit_price;
  final double total_price;
  final String size;
  final String color;

  OrderDetail({
    required this.id,
    required this.created_at,
    required this.order_id,
    required this.product_id,
    required this.quantity,
    required this.unit_price,
    required this.total_price,
    required this.size,
    required this.color,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'] as int,
      created_at: json['created_at'] as String,
      order_id: json['order_id'] as int,
      product_id: json['product_id'] as int,
      quantity: json['quantity'] as int,
      unit_price: (json['unit_price'] as num).toDouble(),
      total_price: (json['total_price'] as num).toDouble(),
      size: json['size'] as String,
      color: json['color'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': product_id,
      'quantity': quantity,
      'unit_price': unit_price,
      'size': size,
      'color': color,
    };
  }
}
