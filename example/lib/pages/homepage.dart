import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/categories.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  void initState() {
    super.initState();
    _checkPopup();
  }

  List<Widget> categoriesItems = [
    ImageRadiusModal(imagePath: Assets.images.categorierowFirst.path, text: "Men"),
    ImageRadiusModal(imagePath: Assets.images.categorierowSecond.path, text: "Women"),
    ImageRadiusModal(imagePath: Assets.images.categorierowThird.path, text: "Kids"),
    ImageRadiusModal(imagePath: Assets.images.categorierowFourth.path, text: "Bags"),
    ImageRadiusModal(imagePath: Assets.images.categorierowFifth.path, text: "Shoes"),
    ImageRadiusModal(imagePath: Assets.images.categorierowSix.path, text: "Accessories"),
  ];

  List<Widget> productCardItems = [
    ProductCardModal(
        imagePath: "assets/images/productcardimage_first.png",
        productStock: "Sold(50 Product)",
        productName: "Long-sleeved T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_second.png",
        productStock: "Sold(50 Product)",
        productName: "Printed Cotton Shirt",
        productPrice: "\$45.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_third.png",
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_fourth.png",
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
          imagePath: "assets/images/popupbannerimage.png",
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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: HomePageAppbar(logoPath: "assets/icons/logotext.png", icon: Icons.notifications),
      ),
      backgroundColor: ColorConstant.instance.neutral9,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: 200,
              child: PageView(
                controller: _pageController,
                children: [
                  HomePageSlider(
                    imagePath: "assets/images/homepagesliderimage.png",
                    headText: "MERGING STYLE WITH",
                    pageController: _pageController,
                    descText: "ELEGANCE",
                  ),
                  HomePageSlider(
                    pageController: _pageController,
                    imagePath: "assets/images/homepagesliderimage.png",
                    headText: "MERGING STYLE WITH",
                    descText: "ELEGANCE",
                  ),
                  HomePageSlider(
                    pageController: _pageController,
                    imagePath: "assets/images/homepagesliderimage.png",
                    headText: "MERGING STYLE WITH",
                    descText: "ELEGANCE",
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(15),
              child: SectionLayout(
                sectionText: "CATEGORIES",
                rightWidget: SectionActionText(
                  text: "All Categories",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
                  },
                ),
                layout: CategoriesRowLayout(items: categoriesItems),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: SectionLayout(
                sectionText: "HOT DEAL",
                layout: ProductGridLayout(productItems: productCardItems),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    HomepageBanner(
                      imagePath: "assets/images/homepagebannerimage_first.png",
                      titleText: "The Collection",
                      subTitleText: "NEW SEASON",
                      descriptionText: "Lorem ipsum dolor sit amet",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HomepageBanner(
                      imagePath: "assets/images/homepagebannerimage_second.png",
                      titleText: "50% Off",
                      subTitleText: "WINTER SALE",
                      descriptionText: "Lorem ipsum dolor sit amet",
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(15),
              child: SectionLayout(
                sectionText: "NEW ARRIVAL",
                layout: ProductRowLayout(items: productCardItems),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: SectionLayout(
                sectionText: "ON SALE",
                rightWidget: TimerLabel(),
                layout: ProductRowLayout(items: productCardItems),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
