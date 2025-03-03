import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddressFormLabel extends StatefulWidget {
  const AddressFormLabel({super.key});

  @override
  State<AddressFormLabel> createState() => _AddressFormLabelState();
}

class _AddressFormLabelState extends State<AddressFormLabel> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isDefault = false;

  final List<String> countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Turkey',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadText(
            fontSize: 30,
            color: ColorConstant.instance.neutral1,
            text: "BILLING DETAILS"),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              Expanded(
                child: TextFieldInput(
                  controller: firstNameController,
                  hintText: 'First Name*',
                ),
              ),
              context.emptySizedWidthBoxNormal,
              Expanded(
                child: TextFieldInput(
                  controller: lastNameController,
                  hintText: 'Last Name*',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TypeaheadTextfieldInput(
            items: countries,
            controller: countryController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFieldInput(
            controller: streetAddressController,
            hintText: 'Street address*',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFieldInput(
            controller: cityController,
            hintText: 'Town/City*',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFieldInput(
            controller: phoneController,
            inputType: InputType.phone,
            hintText: 'Phone Number*',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFieldInput(
            controller: emailController,
            inputType: InputType.email,
            hintText: 'Email Address*',
          ),
        ),
        context.emptySizedHeightBoxNormal,
        Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductText(
                  text: "Choose Location",
                  fontSize: 14,
                  color: ColorConstant.instance.neutral1,
                ),
                context.emptySizedHeightBoxLow,
                const SizedBox(
                  height: 250,
                  child: MapLabel(),
                ),
                context.emptySizedHeightBoxNormal,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductText(
                      text: "Set Default Address",
                      fontSize: 14,
                      color: ColorConstant.instance.neutral1,
                    ),
                    Switch(
                      value: isDefault,
                      onChanged: (value) {
                        setState(() {
                          isDefault = value;
                        });
                      },
                      activeTrackColor: ColorConstant.instance.primary_main,
                      activeColor: ColorConstant.instance.neutral9,
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }
}
