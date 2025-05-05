// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      sold_count: (json['sold_count'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      tags: json['tags'] as List<dynamic>,
      titles: json['titles'] as List<dynamic>,
      product_id: (json['product_id'] as num).toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'image': instance.image,
      'name': instance.name,
      'sold_count': instance.sold_count,
      'price': instance.price,
      'tags': instance.tags,
      'titles': instance.titles,
      'product_id': instance.product_id,
    };
