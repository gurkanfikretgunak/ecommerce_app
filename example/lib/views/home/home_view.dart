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
    _initializeData();
  }

  Future<void> _initializeData() async {
    await Future.wait([
      _loadHomeData(),
      _loadCategories(),
      _checkAndShowPopup(),
    ]);
  }

  Future<void> _loadHomeData() async {
    await context.read<HomeCubit>().loadHomeData();
  }

  Future<void> _loadCategories() async {
    await context.read<CategoriesCubit>().loadCategories();
  }

  Future<void> _checkAndShowPopup() async {
    await context.read<PopUpCubit>().loadBannerPreference();
    final bool isPopupVisible = context.read<PopUpCubit>().state;

    if (isPopupVisible && mounted) {
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
        final l10n = L10n.of(context)!;
        return PopupSaleBanner(
          imagePath: Assets.images.popupbannerimage.path,
          saleTitle: l10n.winterSale,
          subTitle: l10n.saleOff,
          discount: "50",
          checkBoxPressed: (visible) {
            context.read<PopUpCubit>().changeBannerVisible(visible);
          },
        );
      },
    );
  }

  void _navigateToProductDetail(dynamic product) {
    context.read<ProductCubit>().changeProduct(product);
    AutoRouter.of(context).push(const ProductViewRoute());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const _LoadingScreen();
        } else if (state is HomeError) {
          return Center(child: CircularProgressAnimation());
        } else if (state is HomeLoaded) {
          return _buildHomeContent(state);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildHomeContent(HomeLoaded state) {
    final l10n = L10n.of(context)!;

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHomeSlider(),
            context.emptySizedHeightBoxNormal,
            Padding(
              padding: const EdgeInsets.all(15),
              child: _buildCategoriesSection(),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: _buildHotDealsSection(state.hotDeals, l10n.hotDeal),
            ),
            _buildBannerSection(),
            Padding(
              padding: const EdgeInsets.all(15),
              child:
                  _buildProductSection(state.hotDeals, l10n.newArrival, null),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: _buildProductSection(state.hotDeals, l10n.onSale, null),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: HomePageAppbar(
        iconOnPressed: () {
          AutoRouter.of(context).push(const NotificationViewRoute());
        },
        logoPath: Assets.icons.logotext.path,
        icon: Icons.notifications,
      ),
    );
  }

  Widget _buildHomeSlider() {
    String imagePath = Assets.images.homepagesliderimage.path;
    const String headText = "MERGING STYLE WITH";
    const String descText = "ELEGANCE";

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return HomePageSlider(
            pageController: _pageController,
            imagePath: imagePath,
            headText: headText,
            descText: descText,
          );
        },
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final l10n = L10n.of(context)!;

    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, categoriesState) {
        if (categoriesState is CategoriesLoading) {
          return const Center(child: CircularProgressAnimation());
        } else if (categoriesState is CategoriesError) {
          return Center(child: Text(categoriesState.message));
        } else if (categoriesState is CategoriesLoaded) {
          return SectionLayout(
            sectionText: l10n.categories,
            rightWidget: SectionActionText(
              text: l10n.allCategories,
              onTap: () {
                AutoRouter.of(context).push(const CategoriesViewRoute());
              },
            ),
            layout: CategoriesRowLayout(
              items: categoriesState.categories.map((category) {
                return ImageRadiusModal(
                  imagePath: category.smallImage,
                  text: category.title,
                  onTap: () {
                    AutoRouter.of(context)
                        .push(CategorieProductsViewRoute(categorie: category));
                  },
                );
              }).toList(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildHotDealsSection(List products, String title) {
    return SectionLayout(
      sectionText: title,
      layout: ProductGridLayout(
        productItems: _buildProductItems(products),
      ),
    );
  }

  Widget _buildProductSection(
      List products, String title, Widget? rightWidget) {
    return SectionLayout(
      sectionText: title,
      // rightWidget: rightWidget,
      layout: ProductRowLayout(
        items: _buildProductItems(products),
      ),
    );
  }

  List<ProductCardModal> _buildProductItems(List products) {
    return products.map((product) {
      return ProductCardModal(
        imagePath: product.image,
        productName: product.name,
        productPrice: product.price.toString(),
        productStock: product.sold_count.toString(),
        onTap: () => _navigateToProductDetail(product),
      );
    }).toList();
  }

  Widget _buildBannerSection() {
    final l10n = L10n.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          HomepageBanner(
            imagePath: Assets.images.homepagebannerimageFirst.path,
            titleText: l10n.theCollection,
            subTitleText: l10n.newSeason,
            descriptionText: l10n.loremIpsum,
          ),
          context.emptySizedHeightBoxLow,
          HomepageBanner(
            imagePath: Assets.images.homepagebannerimageSecond.path,
            titleText: l10n.percentOff(50),
            subTitleText: l10n.winterSale,
            descriptionText: l10n.loremIpsum,
          ),
        ],
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressAnimation()),
    );
  }
}
