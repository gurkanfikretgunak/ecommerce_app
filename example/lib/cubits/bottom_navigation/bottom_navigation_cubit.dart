// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit({int? initialIndex}) : super(initialIndex ?? 0);

  void setPage(int index) {
    emit(index);
  }
}
