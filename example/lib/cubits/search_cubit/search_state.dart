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

  List<Object?> get props => [
        filter,
      ];

  SearchApply({required this.filter});
  SearchApply copyWith({final Filter? filter}) {
    return SearchApply(
      filter: filter ?? this.filter,
    );
  }
}

class SearchLoaded extends SearchState {
  final List<Product> products;

  SearchLoaded({required this.products});
  @override
  List<Object?> get props => [products];
}

class SearchSuccess extends SearchState {
  final String message;

  SearchSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
