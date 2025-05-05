import 'dart:async';
import 'package:example/core/network/models/filter_model/filter_model.dart';
import 'package:example/core/network/repository/search_respository/search_respository.dart';
import 'package:example/cubits/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(SearchState(
          filter: Filter(tags: const []),
          products: [],
          isLoading: false,
        ));

  Timer? _debounceTimer;

  void _debouncedSearch() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 600), () {
      getSearch();
    });
  }

  void getSearch() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final result = await SearchRespository().getSearchProducts(state.filter);

      if (result.isNotEmpty) {
        emit(state.copyWith(products: result, isLoading: false));
      } else {
        emit(state.copyWith(products: [], isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: "Error: $e", isLoading: false));
    }
  }

  void changeColor(Color color) {
    emit(state.copyWith(filter: state.filter.copyWith(color: color)));
  }

  void changeSize(String size) {
    emit(state.copyWith(filter: state.filter.copyWith(size: size)));
  }

  void changePrice(double price) {
    emit(state.copyWith(filter: state.filter.copyWith(price: price)));
  }

  void changeCategorie(String categorie) {
    emit(state.copyWith(filter: state.filter.copyWith(categorie: categorie)));
  }

  void applyFilters() {
    _debouncedSearch();
  }

  void changeSearchText(String text) {
    emit(state.copyWith(filter: state.filter.copyWith(searchText: text)));
    _debouncedSearch();
  }

  void changeTag(String text) {
    final updatedTags = List<String>.from(state.filter.tags ?? []);

    if (updatedTags.contains(text)) {
      updatedTags.remove(text);
    } else {
      updatedTags.add(text);
    }

    emit(state.copyWith(filter: state.filter.copyWith(tags: updatedTags)));
    _debouncedSearch();
  }

  bool isAdded(String label) {
    return state.filter.tags?.contains(label) ?? false;
  }

  void clearFilters() {
    _debounceTimer?.cancel();
    emit(SearchState(
      filter: Filter(tags: const []),
      products: [],
      isLoading: false,
    ));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
