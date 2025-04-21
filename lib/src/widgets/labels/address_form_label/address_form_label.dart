import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddressFormLabel extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController countryController;
  final TextEditingController streetAddressController;
  final TextEditingController cityController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPhone;
  final bool isDefault;
  final bool? isPhoneValid;
  final bool? isEmailValid;
  final ValueChanged<bool> onDefaultChanged;

  final String titleText;
  final String firstNameHintText;
  final String lastNameHintText;
  final String countryHintText;
  final String streetAddressHintText;
  final String cityHintText;
  final String phoneHintText;
  final String emailHintText;
  final String setDefaultAddressText;

  const AddressFormLabel({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.countryController,
    required this.streetAddressController,
    required this.cityController,
    required this.phoneController,
    required this.emailController,
    required this.isDefault,
    required this.onDefaultChanged,
    this.isPhoneValid,
    this.isEmailValid,
    this.onChangedEmail,
    this.onChangedPhone,
    this.titleText = "BILLING DETAILS",
    this.firstNameHintText = 'First Name*',
    this.lastNameHintText = 'Last Name*',
    this.countryHintText = 'Country*',
    this.streetAddressHintText = 'Street address*',
    this.cityHintText = 'Town/City*',
    this.phoneHintText = 'Phone Number*',
    this.emailHintText = 'Email Address*',
    this.setDefaultAddressText = 'Set Default Address',
  });

  @override
  State<AddressFormLabel> createState() => _AddressFormLabelState();
}

class _AddressFormLabelState extends State<AddressFormLabel> {
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
            text: widget.titleText),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              Expanded(
                child: TextFieldInput(
                  controller: widget.firstNameController,
                  hintText: widget.firstNameHintText,
                  isValid: true,
                ),
              ),
              context.emptySizedWidthBoxNormal,
              Expanded(
                child: TextFieldInput(
                  controller: widget.lastNameController,
                  hintText: widget.lastNameHintText,
                  isValid: true,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TypeaheadTextfieldInput(
            items: countries,
            controller: widget.countryController,
            labelText: widget.countryHintText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFieldInput(
            controller: widget.streetAddressController,
            hintText: widget.streetAddressHintText,
            isValid: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFieldInput(
            controller: widget.cityController,
            hintText: widget.cityHintText,
            isValid: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFieldInput(
            controller: widget.phoneController,
            inputType: InputType.phone,
            hintText: widget.phoneHintText,
            onChanged: widget.onChangedPhone,
            isValid: widget.isPhoneValid ?? true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFieldInput(
            controller: widget.emailController,
            inputType: InputType.email,
            hintText: widget.emailHintText,
            onChanged: widget.onChangedEmail,
            isValid: widget.isEmailValid ?? true,
          ),
        ),
        context.emptySizedHeightBoxNormal,
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.emptySizedHeightBoxLow,
              context.emptySizedHeightBoxNormal,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentText(
                    text: widget.setDefaultAddressText,
                    fontSize: 14,
                    color: ColorConstant.instance.neutral1,
                  ),
                  Switch(
                    value: widget.isDefault,
                    onChanged: widget.onDefaultChanged,
                    activeTrackColor: ColorConstant.instance.primary_main,
                    activeColor: ColorConstant.instance.neutral9,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
