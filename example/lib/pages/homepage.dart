import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  List<Widget> categoriesItems = [
    CategoriesRadiusModal(
        imagePath: "assets/images/categorierow_first.png", text: "Men"),
    CategoriesRadiusModal(
        imagePath: "assets/images/categorierow_second.png", text: "Women"),
    CategoriesRadiusModal(
        imagePath: "assets/images/categorierow_third.png", text: "Kids"),
    CategoriesRadiusModal(
        imagePath: "assets/images/categorierow_fourth.png", text: "Bags"),
    CategoriesRadiusModal(
        imagePath: "assets/images/categorierow_fifth.png", text: "Shoes"),
    CategoriesRadiusModal(
        imagePath: "assets/images/categorierow_six.png", text: "Accessories"),
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: HomePageAppbar(
                  logoPath: "assets/icons/logotext.png",
                  icon: Icons.notifications),
            ),
            SizedBox(height: 20),
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
                child: HomepageBanner(
                  imagePath: "assets/images/homepagebannerimage_first.png",
                  titleText: "The Collection",
                  subTitleText: "NEW SEASON",
                  descriptionText: "Lorem ipsum dolor sit amet",
                )),
          ],
        ),
      ),
    );
  }
}
