import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/filter_model/filter_model.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class SearchState extends Equatable {
  final Filter filter;
  final List<Product> products;
  final bool isLoading;
  final String? errorMessage;

  const SearchState({
    required this.filter,
    required this.products,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [filter, products, isLoading, errorMessage];

  SearchState copyWith({
    Filter? filter,
    List<Product>? products,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SearchState(
      filter: filter ?? this.filter,
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage, // null geçilirse değer null olur
    );
  }
}
