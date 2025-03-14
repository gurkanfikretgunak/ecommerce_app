import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/categories/categories_cubit.dart';
import 'package:example/cubits/categories/categories_state.dart';
import 'package:example/cubits/home/home_cubit.dart';
import 'package:example/cubits/home/home_state.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _checkPopup();
    context.read<HomeCubit>().loadHomeData();
    context.read<CategoriesCubit>().loadCategories();
  }

  List<Widget> productCardItems = [
    ProductCardModal(
        imagePath: Assets.images.productcardimageFirst.path,
        productStock: "Sold(50 Product)",
        productName: "Long-sleeved T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageSecond.path,
        productStock: "Sold(50 Product)",
        productName: "Printed Cotton Shirt",
        productPrice: "\$45.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageFourth.path,
        productStock: "Sold(50 Product)",
        productName: "Embroidered T-Shirt",
        productPrice: "\$39.00"),
  ];

  Future<void> _checkPopup() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool hidePopup = preferences.getBool('hidePopUp') ?? false;

    if (!hidePopup) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showPopup();
      });
    }
  }

  void _showPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopupSaleBanner(
          imagePath: Assets.images.popupbannerimage.path,
          saleTitle: "WINTER SALE",
          subTitle: "SALE OFF",
          discount: "50",
          button: BannerButton(
            icon: Icons.arrow_forward,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeLoaded) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: HomePageAppbar(
                iconOnPressed: () {
                  AutoRouter.of(context).push(const NotificationViewRoute());
                },
                logoPath: Assets.icons.logotext.path,
                icon: Icons.notifications,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth,
                    height: 200,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        HomePageSlider(
                          imagePath: Assets.images.homepagesliderimage.path,
                          headText: "MERGING STYLE WITH",
                          pageController: _pageController,
                          descText: "ELEGANCE",
                        ),
                        HomePageSlider(
                          pageController: _pageController,
                          imagePath: Assets.images.homepagesliderimage.path,
                          headText: "MERGING STYLE WITH",
                          descText: "ELEGANCE",
                        ),
                        HomePageSlider(
                          pageController: _pageController,
                          imagePath: Assets.images.homepagesliderimage.path,
                          headText: "MERGING STYLE WITH",
                          descText: "ELEGANCE",
                        ),
                      ],
                    ),
                  ),
                  context.emptySizedHeightBoxNormal,
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: BlocBuilder<CategoriesCubit, CategoriesState>(
                      builder: (context, categoriesState) {
                        if (categoriesState is CategoriesLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (categoriesState is CategoriesLoaded) {
                          return SectionLayout(
                            sectionText: "CATEGORIES",
                            rightWidget: SectionActionText(
                              text: "All Categories",
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const CategoriesViewRoute());
                              },
                            ),
                            layout: CategoriesRowLayout(
                              items: categoriesState.categories.map((category) {
                                return ImageRadiusModal(
                                  imagePath: category.smallImage,
                                  text: category.title,
                                );
                              }).toList(),
                            ),
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SectionLayout(
                      sectionText: "HOT DEAL",
                      layout: ProductGridLayout(productItems: state.hotDeals),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        HomepageBanner(
                          imagePath:
                              Assets.images.homepagebannerimageFirst.path,
                          titleText: "The Collection",
                          subTitleText: "NEW SEASON",
                          descriptionText: "Lorem ipsum dolor sit amet",
                        ),
                        context.emptySizedHeightBoxLow,
                        HomepageBanner(
                          imagePath:
                              Assets.images.homepagebannerimageSecond.path,
                          titleText: "50% Off",
                          subTitleText: "WINTER SALE",
                          descriptionText: "Lorem ipsum dolor sit amet",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SectionLayout(
                      sectionText: "NEW ARRIVAL",
                      layout: ProductRowLayout(items: state.newArrivals),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SectionLayout(
                      sectionText: "ON SALE",
                      rightWidget: const TimerLabel(),
                      layout: ProductRowLayout(items: state.onSale),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
