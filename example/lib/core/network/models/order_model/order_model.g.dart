// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: (json['id'] as num?)?.toInt(),
      total_price: (json['total_price'] as num?)?.toDouble(),
      created_at: json['created_at'] as String?,
      user_id: json['user_id'] as String?,
      billing_details_id: (json['billing_details_id'] as num?)?.toInt(),
      payment_method_id: (json['payment_method_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'total_price': instance.total_price,
      'created_at': instance.created_at,
      'user_id': instance.user_id,
      'billing_details_id': instance.billing_details_id,
      'payment_method_id': instance.payment_method_id,
    };
