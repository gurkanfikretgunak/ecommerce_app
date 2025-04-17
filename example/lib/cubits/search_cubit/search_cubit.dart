import 'package:example/core/network/models/filter_model/filter_model.dart';
import 'package:example/core/network/respository/product_respository/product_respository.dart';
import 'package:example/core/network/respository/search_respository/search_respository.dart';
import 'package:example/cubits/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchApply(filter: Filter()));

  void getSearch(Filter filter) async {
    try {
      final result = await SearchRespository().getSearchProducts(filter);
      if (result.isNotEmpty) {
        emit(SearchLoaded(products: result));
      } else {
        emit(SearchError("Product Not Found"));
      }
    } catch (e) {
      emit(SearchError("Error: $e"));
    }
  }

  void changeColor(Color color) {
    final applyState = state as SearchApply;
    emit(applyState.copyWith(filter: applyState.filter.copyWith(color: color)));
  }

  void changeSize(String size) {
    final applyState = state as SearchApply;
    emit(applyState.copyWith(filter: applyState.filter.copyWith(size: size)));
  }

  void changePrice(double price) {
    final applyState = state as SearchApply;
    emit(applyState.copyWith(
      filter: applyState.filter.copyWith(price: price),
    ));
  }
}
