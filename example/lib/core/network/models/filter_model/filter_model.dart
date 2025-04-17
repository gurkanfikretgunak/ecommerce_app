import 'package:flutter/material.dart';

class Filter {
  final String? searchText;
  final List<String>? tags;
  final String? categorie;
  final Color? color;
  final String? size;
  final double? price;

  Filter({
    this.searchText,
    this.tags,
    this.categorie,
    this.color,
    this.size,
    this.price,
  });

  Filter copyWith({
    String? searchText,
    List<String>? tags,
    String? categorie,
    Color? color,
    String? size,
    double? price,
  }) {
    return Filter(
      searchText: searchText ?? this.searchText,
      tags: tags ?? this.tags,
      categorie: categorie ?? this.categorie,
      color: color ?? this.color,
      size: size ?? this.size,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'search_text': searchText,
      'tags': tags,
      'categorie': categorie,
      'color': color?.value.toRadixString(16).padLeft(8, '0').toUpperCase(),
      'size': size,
      'price': price,
    };
  }
}
