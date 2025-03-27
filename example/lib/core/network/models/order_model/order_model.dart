import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class Order {
  final int id;
  final double total_price;
  final String created_at;
  final String user_id;
  final int billing_details_id;
  final int payment_method_id;

  Order({
    required this.id,
    required this.total_price,
    required this.created_at,
    required this.user_id,
    required this.billing_details_id,
    required this.payment_method_id,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      total_price: json['total_price'] as double,
      created_at: json['created_at'] as String,
      user_id: json['user_id'] as String,
      billing_details_id: json['billing_details_id'] as int,
      payment_method_id: json['payment_method_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_price': total_price,
      'user_id': user_id,
    };
  }
}
