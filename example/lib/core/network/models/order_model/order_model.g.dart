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
      status: json['status'] as String?,
      billing_name: json['billing_name'] as String?,
      billing_address: json['billing_address'] as String?,
      billing_email: json['billing_email'] as String?,
      billing_phone: json['billing_phone'] as String?,
      payment_method_name: json['payment_method_name'] as String?,
      payment_method_token: json['payment_method_token'] as String?,
    )
      ..orderDetail = json['orderDetail'] == null
          ? null
          : OrderDetail.fromJson(json['orderDetail'] as Map<String, dynamic>)
      ..orderDetails = (json['orderDetails'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'total_price': instance.total_price,
      'created_at': instance.created_at,
      'user_id': instance.user_id,
      'status': instance.status,
      'billing_name': instance.billing_name,
      'billing_address': instance.billing_address,
      'billing_email': instance.billing_email,
      'billing_phone': instance.billing_phone,
      'payment_method_name': instance.payment_method_name,
      'payment_method_token': instance.payment_method_token,
      'orderDetail': instance.orderDetail,
      'orderDetails': instance.orderDetails,
    };
