import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/cubits/categorie_products/categorie_products_cubit.dart';
import 'package:example/cubits/categories/categories_cubit.dart';
import 'package:example/cubits/home/home_cubit.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBloc extends StatelessWidget {
  const MultiBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
      BlocProvider<HomeCubit>(
        create: (_) => HomeCubit(),
      ),
      BlocProvider<CategoriesCubit>(create: (_) => CategoriesCubit()),
      BlocProvider<BottomNavigationCubit>(
          create: (_) => BottomNavigationCubit()),
      BlocProvider<CategorieProductsCubit>(
          create: (_) => CategorieProductsCubit())
    ], child: const ExampleApp());
  }
}
