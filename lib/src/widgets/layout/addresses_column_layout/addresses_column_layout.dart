import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class AddressesColumnLayout extends StatefulWidget {
  final List<AddressBoxModal> addressItems;
  const AddressesColumnLayout({super.key, required this.addressItems});

  @override
  State<AddressesColumnLayout> createState() => _AddressesColumnLayoutState();
}

class _AddressesColumnLayoutState extends State<AddressesColumnLayout> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.addressItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Dismissible(
                  key: Key(widget.addressItems[index].name),
                  direction: DismissDirection.endToStart,
                  background: Container(),
                  secondaryBackground: Container(
                    color: ColorConstant.instance.secondary2,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      return true;
                    }
                    return false;
                  },
                  onDismissed: (direction) {
                    setState(() {
                      widget.addressItems.removeAt(index);
                      if (widget.addressItems.isEmpty) {
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: AddressBoxModal(
                    name: widget.addressItems[index].name,
                    address: widget.addressItems[index].address,
                    email: widget.addressItems[index].email,
                    phone: widget.addressItems[index].phone,
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
      ],
    );
  }
}
