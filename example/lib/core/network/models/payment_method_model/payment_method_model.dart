import 'package:json_annotation/json_annotation.dart';

part 'payment_method_model.g.dart';

@JsonSerializable()
class PaymentMethod {
  final int? id;
  final String? created_at;
  final String name;
  final String card_last4;
  final String card_brand;
  final String card_expiry_month;
  final int card_expiry_year;
  final String token;
  final bool is_default;
  final String user_id;

  PaymentMethod({
    this.id,
    this.created_at,
    required this.name,
    required this.card_last4,
    required this.card_brand,
    required this.card_expiry_month,
    required this.card_expiry_year,
    required this.token,
    required this.is_default,
    required this.user_id,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      created_at: json['created_at'],
      name: json['name'],
      card_last4: json['card_last4'],
      card_brand: json['card_brand'],
      card_expiry_month: json['card_expiry_month'],
      card_expiry_year: json['card_expiry_year'],
      token: json['token'],
      is_default: json['is_default'],
      user_id: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'card_last4': card_last4,
      'card_brand': card_brand,
      'card_expiry_month': card_expiry_month,
      'card_expiry_year': card_expiry_year,
      'token': token,
      'is_default': is_default,
      'user_id': user_id,
    };
  }
}
