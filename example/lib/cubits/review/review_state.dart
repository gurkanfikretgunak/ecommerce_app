import 'package:equatable/equatable.dart';
import 'package:example/models/product_detail_model/product_detail_model.dart';
import 'package:flutter/material.dart';

abstract class ReviewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReviewInitial extends ReviewState {}

class ReviewSuccess extends ReviewState {
  final String message;

  ReviewSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ReviewError extends ReviewState {
  final String error;

  ReviewError(this.error);

  @override
  List<Object?> get props => [error];
}
