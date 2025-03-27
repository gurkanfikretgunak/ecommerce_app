// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: (json['id'] as num?)?.toInt(),
      createdId: json['createdId'] as String?,
      userId: json['userId'] as String,
      productId: (json['productId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      size: json['size'] as String,
      color: json['color'] as String,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'createdId': instance.createdId,
      'userId': instance.userId,
      'productId': instance.productId,
      'size': instance.size,
      'color': instance.color,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'product': instance.product,
    };
