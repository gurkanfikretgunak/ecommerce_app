import 'package:example/core/cubits/auth/auth_cubit.dart';
import 'package:example/core/cubits/billing_detail/billing_detail_cubit.dart';
import 'package:example/core/cubits/cart/cart_cubit.dart';
import 'package:example/core/cubits/locale/locale_cubit.dart';
import 'package:example/core/cubits/notification/notification_cubit.dart';

import 'package:example/core/cubits/order/order_cubit.dart';
import 'package:example/core/cubits/orderwishlist/orderwishlist_cubit.dart';
import 'package:example/core/cubits/payment_method/payment_method_cubit.dart';
import 'package:example/core/cubits/pop-up/pop-up_cubit.dart';
import 'package:example/core/cubits/product/product_cubit.dart';
import 'package:example/core/cubits/profile_picture/profile_picture_cubit.dart';
import 'package:example/core/cubits/review/review_cubit.dart';
import 'package:example/core/cubits/search_cubit/search_cubit.dart';
import 'package:example/core/cubits/validation/validation_cubit.dart';
import 'package:example/core/cubits/wishlist/wishlist_cubit.dart';
import 'package:example/main.dart';
import 'package:example/core/cubits/categorie_products/categorie_products_cubit.dart';
import 'package:example/core/cubits/categories/categories_cubit.dart';
import 'package:example/core/cubits/home/home_cubit.dart';
import 'package:example/core/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/core/cubits/payment_step/payment_step_cubit.dart';
import 'package:example/core/cubits/product_detail/product_detail_cubit.dart';
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
      BlocProvider<OrderCubit>(create: (_) => OrderCubit()),
      BlocProvider<BillingDetailCubit>(create: (_) => BillingDetailCubit()),
      BlocProvider<PaymentMethodCubit>(create: (_) => PaymentMethodCubit()),
      BlocProvider<WishlistCubit>(
        create: (_) => WishlistCubit(),
      ),
      BlocProvider<SearchCubit>(
        create: (_) => SearchCubit(),
      ),
      BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
      BlocProvider<PopUpCubit>(create: (_) => PopUpCubit()),
      BlocProvider<OrderwishlistCubit>(create: (_) => OrderwishlistCubit()),
      BlocProvider<ProfilePictureCubit>(create: (_) => ProfilePictureCubit()),
      BlocProvider<NotificationCubit>(
        create: (_) => NotificationCubit(),
      ),
    ], child: const ExampleApp());
  }
}
