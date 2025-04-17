import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/filter_model/filter_model.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchApply extends SearchState {
  final Filter filter;
  final List<Product> products;

  SearchApply({required this.filter, required this.products});

  List<Object?> get props => [filter, products];

  SearchApply copyWith({Filter? filter, List<Product>? products}) {
    return SearchApply(
      filter: filter ?? this.filter,
      products: products ?? this.products,
    );
  }
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
