import 'package:example/pages/newaddress/newaddress_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class AddressesView extends StatefulWidget {
  final List<AddressBoxModal>? addressItems;

  const AddressesView({super.key, this.addressItems});

  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  late List<AddressBoxModal> addressItems;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    addressItems = widget.addressItems ??
        [
          const AddressBoxModal(
              name: "Theresa Webb",
              address: "3517 W. Gray St. Utica, Pennsylvania 57867",
              email: "willie.jennings@example.com",
              isSelected: true,
              phone: "(480) 555-0103"),
          const AddressBoxModal(
              name: "Alemdag ev",
              address: "3517 W. Gray St. Utica, Pennsylvania 57867",
              email: "willie.jennings@example.com",
              isSelected: false,
              phone: "(480) 555-0103"),
          const AddressBoxModal(
              name: "Madenler ",
              address: "3517 W. Gray St. Utica, Pennsylvania 57867",
              email: "willie.jennings@example.com",
              isSelected: false,
              phone: "(480) 555-0103"),
        ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: "ADDRESS",
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: AddressesColumnLayout(
                addressItems: addressItems,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const NewAddressViewRoute());
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewAddressView()));*/
                  },
                  height: 50,
                  text: "Add New Address"),
            ),
          ],
        ),
      ),
    );
  }
}
