import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class FilterFormLabel extends StatefulWidget {
  const FilterFormLabel({super.key});

  @override
  State<FilterFormLabel> createState() => _FilterFormLabelState();
}

class _FilterFormLabelState extends State<FilterFormLabel> {
  final List<String> items = [
    'Shoes',
    'Dresses',
    'Shirts',
    'Polos',
    'Jeans',
    'Blazers',
    'Coats',
    'Trousers',
    'Skirts',
    'Bags',
    'Jacket',
    'Top',
  ];

  final TextEditingController menController = TextEditingController();
  final TextEditingController womenController = TextEditingController();
  final TextEditingController kidsController = TextEditingController();

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
                  text: "FILTER",
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
              items: items,
              labelText: "Men",
              controller: menController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TypeaheadTextfieldInput(
              items: items,
              labelText: "Women",
              controller: womenController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: TypeaheadTextfieldInput(
              items: items,
              labelText: "Kids",
              controller: kidsController,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: FilterSectionLabel(
                title: "COLOR",
                element: ColorsLabel(
                  colors: [
                    Colors.brown,
                    Colors.grey,
                    Colors.blue,
                    Colors.pinkAccent,
                    Colors.green,
                    Colors.yellow,
                  ],
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: FilterSectionLabel(title: "SIZE", element: SizesLabel()),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: FilterSectionLabel(
              title: "PRICE",
              element: RangeSliderInput(),
            ),
          ),
        ],
      ),
    );
  }
}
