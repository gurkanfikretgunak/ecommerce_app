import 'package:auto_route/annotations.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/pages/account/account_view.dart';
import 'package:example/pages/home/home_view.dart';
import 'package:example/pages/orderwishlist/orderwishlist_view.dart';
import 'package:example/pages/payment/payment_view.dart';
import 'package:example/pages/search/search_view.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class MainpageView extends StatefulWidget {
  final int? pageNo;

  const MainpageView({super.key, this.pageNo});

  @override
  State<MainpageView> createState() => _MainpageViewState();
}

class _MainpageViewState extends State<MainpageView> {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: "Home",
      backgroundColor: ColorConstant.instance.neutral9,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.favorite),
      label: "Wishlist",
      backgroundColor: ColorConstant.instance.neutral9,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.local_mall),
      label: "Cart",
      backgroundColor: ColorConstant.instance.neutral9,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.search),
      label: "Search",
      backgroundColor: ColorConstant.instance.neutral9,
    ),
    BottomNavigationBarItem(
      icon: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return AccountPictureLabel(
              imageWidth: 24,
              imageHeight: 24,
              imagePath: state.user.photoURL ?? "",
            );
          }
          return const SizedBox();
        },
      ),
      label: "Account",
      backgroundColor: ColorConstant.instance.neutral9,
    ),
  ];

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavigationCubit(initialIndex: widget.pageNo ?? 0),
      child: Scaffold(
        body: BlocBuilder<BottomNavigationCubit, int>(
          builder: (context, currentPage) {
            return getPage(currentPage);
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavigationCubit, int>(
          builder: (context, currentPage) {
            return BottomNavigationLabel(
              items: items,
              currentIndex: currentPage,
              onTap: (index) {
                context.read<BottomNavigationCubit>().setPage(index);
              },
            );
          },
        ),
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const OrderwishlistView();
      case 2:
        return const PaymentView();
      case 3:
        return const SearchView();
      case 4:
        return const AccountView();
      default:
        return const HomeView();
    }
  }
}
