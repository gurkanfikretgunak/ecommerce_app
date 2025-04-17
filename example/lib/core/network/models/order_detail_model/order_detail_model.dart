import 'package:json_annotation/json_annotation.dart';

part 'order_detail_model.g.dart';

@JsonSerializable()
class OrderDetail {
  int? id;
  String? created_at;
  int? order_id;
  int? product_id;
  int? quantity;
  double? unit_price;
  double? total_price;
  String? size;
  String? color;
  String? image;
  String? name;

  OrderDetail({
    this.id,
    this.created_at,
    this.order_id,
    this.product_id,
    this.quantity,
    this.unit_price,
    this.total_price,
    this.size,
    this.color,
    this.image,
    this.name,
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
      image: json['image'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': product_id,
      'quantity': quantity,
      'unit_price': unit_price,
      'size': size,
      'color': color,
      'image': image,
      'name': name,
    };
  }
}
