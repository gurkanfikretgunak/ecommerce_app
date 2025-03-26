import 'package:auto_route/auto_route.dart';
import 'package:example/views/mainpage/models/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    context.read<BottomNavigationCubit>().setPage(3);
                    /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchView()));*/
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
