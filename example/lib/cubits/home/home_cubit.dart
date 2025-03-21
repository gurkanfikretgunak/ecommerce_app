import 'package:bloc/bloc.dart';
import 'package:example/cubits/home/home_state.dart';
import 'package:example/respository/product_respository/product_respository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  Future<void> loadHomeData() async {
    try {
      emit(HomeLoading());

      final hotDeals =
          await ProductRespository().getProducts(title: "hot deal");
      final newArrivals =
          await ProductRespository().getProducts(title: "new arrival");
      final onSales = await ProductRespository().getProducts(title: "on sale");

      emit(HomeLoaded(
          hotDeals: hotDeals, newArrivals: newArrivals, onSale: onSales));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
