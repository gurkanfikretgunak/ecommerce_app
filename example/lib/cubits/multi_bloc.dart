import 'package:example/views/auth/signup/models/auth_cubit.dart';

import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/views/categorie_products/models/categorie_products_cubit.dart';
import 'package:example/views/categories/models/categories_cubit.dart';
import 'package:example/views/home/models/home_cubit.dart';
import 'package:example/views/mainpage/models/bottom_navigation_cubit.dart';
import 'package:example/views/payment/models/payment_step_cubit.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/views/product/models/product_detail_cubit.dart';
import 'package:example/cubits/review/review_cubit.dart';
import 'package:example/cubits/validation/validation_cubit.dart';
import 'package:example/main.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
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
      BlocProvider(create: (_) => ValidationCubit()),
      BlocProvider<CategorieProductsCubit>(
          create: (_) => CategorieProductsCubit()),
      BlocProvider<ProductCubit>(create: (_) => ProductCubit()),
      BlocProvider<PaymentStepCubit>(create: (_) => PaymentStepCubit()),
      BlocProvider<ProductDetailCubit>(create: (_) => ProductDetailCubit()),
      BlocProvider<ReviewCubit>(create: (_) => ReviewCubit()),
      BlocProvider<CartCubit>(create: (_) => CartCubit()),
    ], child: const ExampleApp());
  }
}
