import 'package:example/pages/addresses/addresses_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NewAddressView extends StatefulWidget {
  const NewAddressView({super.key});

  @override
  State<NewAddressView> createState() => _NewAddressViewState();
}

class _NewAddressViewState extends State<NewAddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: "NEW ADDRESS",
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const AddressFormLabel(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: CustomButton(
                    onPressed: () {
                      AutoRouter.of(context).push(AddressesViewRoute());
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddressesView()));*/
                    },
                    height: 50,
                    text: "Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
