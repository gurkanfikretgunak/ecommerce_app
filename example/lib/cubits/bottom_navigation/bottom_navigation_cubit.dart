// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  void setPage(int index) {
    emit(index);
  }
}
