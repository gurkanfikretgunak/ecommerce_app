// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wishlist _$WishlistFromJson(Map<String, dynamic> json) => Wishlist(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['productId'] as num).toInt(),
      createdAt: json['createdAt'] as String?,
      userId: (json['userId'] as num).toInt(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WishlistToJson(Wishlist instance) => <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'createdAt': instance.createdAt,
      'userId': instance.userId,
      'product': instance.product,
    };
