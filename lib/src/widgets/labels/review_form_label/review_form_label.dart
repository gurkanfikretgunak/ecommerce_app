import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ReviewFormLabel extends StatefulWidget {
  const ReviewFormLabel({super.key});

  @override
  State<ReviewFormLabel> createState() => _ReviewFormLabelState();
}

class _ReviewFormLabelState extends State<ReviewFormLabel> {
  final TextEditingController reviewTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();

  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadText(
          text: "ADD A REVIEW",
          fontSize: 20,
          color: ColorConstant.instance.neutral1,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFieldInput(
            hintText: "Your Review * ", controller: reviewTextController),
        const SizedBox(
          height: 10,
        ),
        TextFieldInput(hintText: "Name * ", controller: nameTextController),
        const SizedBox(
          height: 10,
        ),
        TextFieldInput(
          hintText: "Email* ",
          inputType: InputType.email,
          controller: emailTextController,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            ProductText(
                color: ColorConstant.instance.neutral4,
                fontSize: 10,
                text: "Your Rating * "),
            const SizedBox(
              width: 5,
            ),
            const RateInputRowLayout(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
              value: checkbox,
              activeColor: ColorConstant.instance.primary_main,
              side:
                  BorderSide(color: ColorConstant.instance.neutral4, width: 1),
              onChanged: (value) {
                setState(() {
                  checkbox = value!;
                });
              },
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ProductText(
                  textAlign: TextAlign.left,
                  color: ColorConstant.instance.neutral4,
                  fontSize: 10,
                  softWrap: true,
                  text:
                      "Save my name, email, and website in this browser for the next time I comment."),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          width: 130,
          height: 40,
          color: ColorConstant.instance.neutral9,
          textColor: ColorConstant.instance.neutral1,
          text: "SUBMIT",
          borderColor: ColorConstant.instance.neutral4,
          onPressed: () {},
        )
      ],
    );
  }
}
