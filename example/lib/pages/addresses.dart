import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Addresses extends StatefulWidget {
  final List<AddressBoxModal>? addressItems;

  Addresses({super.key, this.addressItems});

  @override
  State<Addresses> createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  late List<AddressBoxModal> addressItems;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    addressItems = widget.addressItems ??
        [
          AddressBoxModal(
              name: "Theresa Webb",
              address: "3517 W. Gray St. Utica, Pennsylvania 57867",
              email: "willie.jennings@example.com",
              isSelected: true,
              phone: "(480) 555-0103"),
          AddressBoxModal(
              name: "Alemdag ev",
              address: "3517 W. Gray St. Utica, Pennsylvania 57867",
              email: "willie.jennings@example.com",
              isSelected: false,
              phone: "(480) 555-0103"),
          AddressBoxModal(
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
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: addressItems.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: Key(addressItems[index].name),
                      direction: DismissDirection.endToStart,
                      background: Container(),
                      secondaryBackground: Container(
                        color: ColorConstant.instance.secondary2,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          return true;
                        }
                        return false;
                      },
                      onDismissed: (direction) {
                        setState(() {
                          addressItems.removeAt(index);
                          if (addressItems.length == 0) {
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: AddressBoxModal(
                        name: addressItems[index].name,
                        address: addressItems[index].address,
                        email: addressItems[index].email,
                        phone: addressItems[index].phone,
                        isSelected: selectedIndex == index,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomButton(
                  onPressed: () {}, height: 50, text: "Add New Address"),
            ),
          ],
        ),
      ),
    );
  }
}
