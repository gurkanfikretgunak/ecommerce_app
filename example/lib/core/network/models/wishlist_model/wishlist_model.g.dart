// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wishlist _$WishlistFromJson(Map<String, dynamic> json) => Wishlist(
      id: (json['id'] as num?)?.toInt(),
      product_id: (json['product_id'] as num).toInt(),
      created_at: json['created_at'] as String?,
      user_id: json['user_id'] as String,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WishlistToJson(Wishlist instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'product_id': instance.product_id,
      'user_id': instance.user_id,
      'sizes': instance.sizes,
      'colors': instance.colors,
      'product': instance.product,
    };
