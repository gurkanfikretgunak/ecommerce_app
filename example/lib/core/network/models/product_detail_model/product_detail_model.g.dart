// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) =>
    ProductDetail(
      id: (json['id'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      rate: (json['rate'] as num).toDouble(),
      rate_count: (json['rate_count'] as num).toInt(),
      info: json['info'] as String,
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      description_image: (json['description_image'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'rate': instance.rate,
      'rate_count': instance.rate_count,
      'info': instance.info,
      'colors': instance.colors,
      'sizes': instance.sizes,
      'description': instance.description,
      'description_image': instance.description_image,
      'reviews': instance.reviews,
    };
