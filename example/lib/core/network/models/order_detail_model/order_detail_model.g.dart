// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      id: (json['id'] as num).toInt(),
      created_at: json['created_at'] as String,
      order_id: (json['order_id'] as num).toInt(),
      product_id: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      unit_price: (json['unit_price'] as num).toDouble(),
      total_price: (json['total_price'] as num).toDouble(),
      size: json['size'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'order_id': instance.order_id,
      'product_id': instance.product_id,
      'quantity': instance.quantity,
      'unit_price': instance.unit_price,
      'total_price': instance.total_price,
      'size': instance.size,
      'color': instance.color,
    };
