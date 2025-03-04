import 'package:example/pages/newaddress/newaddress_view.dart';
import 'package:example/pages/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.instance.neutral9,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const FilterFormLabel(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchView()));
                      },
                      height: 50,
                      text: "Apply Filter"),
                ),
              ],
            ),
          ),
        ));
  }
}
