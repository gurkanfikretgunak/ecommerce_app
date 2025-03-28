import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class Order {
  int? id;
  double? total_price;
  String? created_at;
  String? user_id;
  int? billing_details_id;
  int? payment_method_id;

  Order({
    this.id,
    this.total_price,
    this.created_at,
    this.user_id,
    this.billing_details_id,
    this.payment_method_id,
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
