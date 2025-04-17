import 'dart:async';
import 'package:example/core/network/models/filter_model/filter_model.dart';
import 'package:example/core/network/respository/search_respository/search_respository.dart';
import 'package:example/cubits/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchApply(filter: Filter(), products: []));

  Timer? _debounceTimer;

  void _debouncedSearch() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 600), () {
      getSearch();
    });
  }

  void getSearch() async {
    try {
      final applyState = state as SearchApply;
      final result =
          await SearchRespository().getSearchProducts(applyState.filter);
      if (result.isNotEmpty) {
        emit(applyState.copyWith(products: result));
      } else {
        emit(applyState.copyWith(products: []));
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
    emit(applyState.copyWith(filter: applyState.filter.copyWith(price: price)));
  }

  void changeCategorie(String categorie) {
    final applyState = state as SearchApply;
    emit(applyState.copyWith(
        filter: applyState.filter.copyWith(categorie: categorie)));
  }

  void changeSearchText(String text) {
    final applyState = state as SearchApply;
    emit(applyState.copyWith(
        filter: applyState.filter.copyWith(searchText: text)));
    _debouncedSearch();
  }

  void clearFilters() {
    _debounceTimer?.cancel();
    final applyState = state as SearchApply;
    emit(applyState.copyWith(filter: Filter(), products: []));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
