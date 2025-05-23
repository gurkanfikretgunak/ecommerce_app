import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class FilterFormLabel extends StatefulWidget {
  final TextEditingController categorieController;
  final Color? selectedColor;
  final Function(Color)? onColorSelected;
  final List<Color> colors;
  final List<String> categories;
  final String? selectedSize;
  final Function(String)? onSizeSelected;
  final Function(double)? onPriceChanged;
  final Function(String)? onCategorieChanged;
  final VoidCallback? iconCallBack;
  final List<String>? sizes;

  final String filterText;
  final String categoryText;
  final String colorText;
  final String sizeText;
  final String priceText;

  const FilterFormLabel({
    super.key,
    required this.categorieController,
    this.onColorSelected,
    this.selectedColor,
    required this.colors,
    required this.categories,
    this.sizes,
    this.selectedSize,
    this.onSizeSelected,
    this.onPriceChanged,
    this.iconCallBack,
    this.onCategorieChanged,
    this.filterText = "FILTER",
    this.categoryText = "Categorie",
    this.colorText = "COLOR",
    this.sizeText = "SIZE",
    this.priceText = "PRICE",
  });

  @override
  State<FilterFormLabel> createState() => _FilterFormLabelState();
}

class _FilterFormLabelState extends State<FilterFormLabel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.emptySizedHeightBoxNormal,
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadText(
                  fontSize: 30,
                  color: ColorConstant.instance.neutral1,
                  text: widget.filterText,
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: widget.iconCallBack,
                  icon: Icon(
                    Icons.close,
                    color: ColorConstant.instance.neutral1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TypeaheadTextfieldInput(
              items: widget.categories,
              labelText: widget.categoryText,
              onTextChanged: widget.onCategorieChanged,
              controller: widget.categorieController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: FilterSectionLabel(
                title: widget.colorText,
                element: ColorsLabel(
                  selectedColor: widget.selectedColor,
                  onColorSelected: widget.onColorSelected,
                  colors: widget.colors,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: FilterSectionLabel(
              title: widget.sizeText,
              element: SizesLabel(
                sizes: widget.sizes,
                onSizeSelected: widget.onSizeSelected,
                selectedSize: widget.selectedSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: FilterSectionLabel(
              title: widget.priceText,
              element: RangeSliderInput(
                onChanged: widget.onPriceChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
