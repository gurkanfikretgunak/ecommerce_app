import 'package:example/core/network/models/review_model/review_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetail {
  final int id;
  final List<String> images;
  final double rate;
  final int rate_count;
  final String info;
  final List<String> colors;
  final List<String> sizes;
  final String description;
  final List<String> description_image;
  final bool is_favorite;
  List<Review>? reviews;

  ProductDetail({
    required this.id,
    required this.images,
    required this.rate,
    required this.rate_count,
    required this.info,
    required this.colors,
    required this.sizes,
    required this.description,
    required this.description_image,
    required this.is_favorite,
    this.reviews,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      images: List<String>.from(json['images']),
      rate: json['rate'],
      rate_count: json['rate_count'],
      info: json['info'],
      colors: List<String>.from(json['colors']),
      sizes: List<String>.from(json['sizes']),
      description: json['description'],
      description_image: List<String>.from(json['description_image']),
      is_favorite: json['is_favorite'],
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((reviewJson) => Review.fromJson(reviewJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': images,
      'rate': rate,
      'rate_count': rate_count,
      'info': info,
      'colors': colors,
      'sizes': sizes,
      'description': description,
      'description_image': description_image,
      'is_favorite': is_favorite,
    };
  }
}
