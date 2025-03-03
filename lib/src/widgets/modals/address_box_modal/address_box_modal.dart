import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class AddressBoxModal extends StatelessWidget {
  final String name;
  final String address;
  final String email;
  final String phone;

  final Color? containerColor;
  final Color? nameColor;
  final Color? addressColor;
  final Color? emailColor;
  final Color? phoneColor;

  final bool? isSelected;

  final VoidCallback? onTap;

  const AddressBoxModal({
    super.key,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    this.containerColor,
    this.nameColor,
    this.addressColor,
    this.emailColor,
    this.phoneColor,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: 124,
        decoration: BoxDecoration(
          color: containerColor ?? ColorConstant.instance.neutral7,
          border: BorderDirectional(
            bottom: BorderSide(
              color: ColorConstant.instance.neutral7,
            ),
            start: isSelected == true
                ? BorderSide(
                    width: 3,
                    color: ColorConstant.instance.primary_main,
                  )
                : BorderSide.none,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductText(
                      text: name,
                      color: nameColor ?? ColorConstant.instance.neutral1,
                      fontSize: 14,
                    ),
                    ProductText(
                      text: address,
                      color: addressColor ?? ColorConstant.instance.neutral4,
                      fontSize: 10,
                    ),
                    ProductText(
                      text: email,
                      color: emailColor ?? ColorConstant.instance.neutral4,
                      fontSize: 10,
                    ),
                    ProductText(
                      text: phone,
                      color: phoneColor ?? ColorConstant.instance.neutral4,
                      fontSize: 10,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(size: 15, Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
