import 'package:bloc/bloc.dart';
import 'package:example/core/network/repository/product_repository/product_repository.dart';
import 'package:example/core/cubits/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  Future<void> loadHomeData() async {
    try {
      emit(HomeLoading());

      final hotDeals = await ProductRepository().getProducts(title: "hot deal");
      final newArrivals =
          await ProductRepository().getProducts(title: "new arrival");
      final onSales = await ProductRepository().getProducts(title: "on sale");

      emit(HomeLoaded(
          hotDeals: hotDeals, newArrivals: newArrivals, onSale: onSales));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
