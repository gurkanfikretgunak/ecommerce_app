import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SearchAppbar(
          text: "Search Product ...",
          onPressed: () {
            Navigator.pop(context);
          },
          iconOnPressed: () {},
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
