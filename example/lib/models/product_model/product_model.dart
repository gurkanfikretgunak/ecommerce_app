import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String createdAt;
  final String name;
  final int sold_count;
  final String price;
  final List<String> tags;
  final List<String> titles;
  final int product_id;

  Product(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.sold_count,
      required this.price,
      required this.tags,
      required this.titles,
      required this.product_id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      sold_count: json['sold_count'],
      price: json['price'],
      tags: json['tags'],
      titles: json['titles'],
      product_id: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'name': name,
      'sold_count': sold_count,
      'price': price,
      'tags': tags,
      'titles': titles,
      'product_id': product_id,
    };
  }
}
