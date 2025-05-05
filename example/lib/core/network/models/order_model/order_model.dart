import 'package:example/core/network/models/order_detail_model/order_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class Order {
  int? id;
  double? total_price;
  String? created_at;
  String? user_id;
  String? status;
  String? billing_name;
  String? billing_address;
  String? billing_email;
  String? billing_phone;
  String? payment_method_name;
  String? payment_method_token;

  OrderDetail? orderDetail;

  List<OrderDetail?>? orderDetails;

  Order({
    this.id,
    this.total_price,
    this.created_at,
    this.user_id,
    this.status,
    this.billing_name,
    this.billing_address,
    this.billing_email,
    this.billing_phone,
    this.payment_method_name,
    this.payment_method_token,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      total_price: json['total_price'],
      created_at: json['created_at'],
      user_id: json['user_id'],
      status: json['status'],
      billing_name: json['billing_name'],
      billing_address: json['billing_address'],
      billing_email: json['billing_email'],
      billing_phone: json['billing_phone'],
      payment_method_name: json['payment_method_name'],
      payment_method_token: json['payment_method_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'total_price': total_price,
      'billing_name': billing_name,
      'billing_address': billing_address,
      'billing_email': billing_email,
      'billing_phone': billing_phone,
      'payment_method_name': payment_method_name,
      'payment_method_token': payment_method_token,
    };
  }
}
