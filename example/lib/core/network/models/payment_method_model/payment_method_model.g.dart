// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      id: (json['id'] as num?)?.toInt(),
      created_at: json['created_at'] as String?,
      name: json['name'] as String,
      card_last4: json['card_last4'] as String,
      card_brand: json['card_brand'] as String,
      card_expiry_month: json['card_expiry_month'] as String,
      card_expiry_year: (json['card_expiry_year'] as num).toInt(),
      token: json['token'] as String,
      is_default: json['is_default'] as bool,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'name': instance.name,
      'card_last4': instance.card_last4,
      'card_brand': instance.card_brand,
      'card_expiry_month': instance.card_expiry_month,
      'card_expiry_year': instance.card_expiry_year,
      'token': instance.token,
      'is_default': instance.is_default,
      'user_id': instance.user_id,
    };
