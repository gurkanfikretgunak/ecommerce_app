import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/account/account_view.dart';
import 'package:example/pages/home/home_view.dart';
import 'package:example/pages/orderwishlist/orderwishlist_view.dart';
import 'package:example/pages/payment/payment_view.dart';
import 'package:example/pages/search/search_view.dart';
import 'package:example/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class MainpageView extends StatefulWidget {
  const MainpageView({super.key});

  @override
  State<MainpageView> createState() => _MainpageViewState();
}

class _MainpageViewState extends State<MainpageView> {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: "Home",
        backgroundColor: ColorConstant.instance.neutral9),
    BottomNavigationBarItem(
        icon: const Icon(Icons.favorite),
        label: "Wishlist",
        backgroundColor: ColorConstant.instance.neutral9),
    BottomNavigationBarItem(
        icon: const Icon(Icons.shopping_cart),
        label: "Cart",
        backgroundColor: ColorConstant.instance.neutral9),
    BottomNavigationBarItem(
        icon: const Icon(Icons.search),
        label: "Search",
        backgroundColor: ColorConstant.instance.neutral9),
    BottomNavigationBarItem(
        icon: FutureBuilder<User?>(
          future: AuthService().getCurrentUser(),
          builder: (context, snapshot) => snapshot.hasData
              ? AccountPictureLabel(
                  imageWidth: 24,
                  imageHeight: 24,
                  imagePath: snapshot.data!.photoURL ?? "",
                )
              : const SizedBox(),
        ),
        label: "Account",
        backgroundColor: ColorConstant.instance.neutral9),
  ];

  late int currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
  }

  void setCurrentPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(currentPage),
      bottomNavigationBar: BottomNavigationLabel(
          items: items, currentIndex: currentPage, onTap: setCurrentPage),
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
