import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/categories/categories_cubit.dart';
import 'package:example/cubits/categories/categories_state.dart';
import 'package:example/cubits/home/home_cubit.dart';
import 'package:example/cubits/home/home_state.dart';
import 'package:example/cubits/pop-up/pop-up_cubit.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/l10n/app_l10n.dart';

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

  Future<void> _checkPopup() async {
    await context.read<PopUpCubit>().loadBannerPreference();
    final bool isPopupVisible = context.read<PopUpCubit>().state;

    if (isPopupVisible) {
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
          saleTitle: L10n.of(context)!.winterSale,
          subTitle: L10n.of(context)!.saleOff,
          discount: "50",
          checkBoxPressed: (visible) {
            context.read<PopUpCubit>().changeBannerVisible(visible);
          },
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
              child: Column(children: [
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
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (categoriesState is CategoriesLoaded) {
                        return SectionLayout(
                          sectionText: L10n.of(context)!.categories,
                          rightWidget: SectionActionText(
                            text: L10n.of(context)!.allCategories,
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
                                onTap: () {
                                  AutoRouter.of(context).push(
                                      CategorieProductsViewRoute(
                                          categorie: category));
                                },
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
                    sectionText: L10n.of(context)!.hotDeal,
                    layout: ProductGridLayout(
                      productItems: state.hotDeals.map((product) {
                        return ProductCardModal(
                          imagePath: product.image,
                          productName: product.name,
                          productPrice: product.price.toString(),
                          productStock: product.sold_count.toString(),
                          onTap: () {
                            context.read<ProductCubit>().changeProduct(product);
                            AutoRouter.of(context)
                                .push(const ProductViewRoute());
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      HomepageBanner(
                        imagePath: Assets.images.homepagebannerimageFirst.path,
                        titleText: L10n.of(context)!.theCollection,
                        subTitleText: L10n.of(context)!.newSeason,
                        descriptionText: L10n.of(context)!.loremIpsum,
                      ),
                      context.emptySizedHeightBoxLow,
                      HomepageBanner(
                        imagePath: Assets.images.homepagebannerimageSecond.path,
                        titleText: L10n.of(context)!.percentOff(50),
                        subTitleText: L10n.of(context)!.winterSale,
                        descriptionText: L10n.of(context)!.loremIpsum,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SectionLayout(
                    sectionText: L10n.of(context)!.newArrival,
                    layout: ProductRowLayout(
                      items: state.hotDeals.map((product) {
                        return ProductCardModal(
                          imagePath: product.image,
                          productName: product.name,
                          productPrice: product.price.toString(),
                          productStock: product.sold_count.toString(),
                          onTap: () {
                            context.read<ProductCubit>().changeProduct(product);
                            AutoRouter.of(context)
                                .push(const ProductViewRoute());
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SectionLayout(
                    sectionText: L10n.of(context)!.onSale,
                    rightWidget: const TimerLabel(),
                    layout: ProductRowLayout(
                      items: state.hotDeals.map((product) {
                        return ProductCardModal(
                          imagePath: product.image,
                          productName: product.name,
                          productPrice: product.price.toString(),
                          productStock: product.sold_count.toString(),
                          onTap: () {
                            context.read<ProductCubit>().changeProduct(product);
                            AutoRouter.of(context)
                                .push(const ProductViewRoute());
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
