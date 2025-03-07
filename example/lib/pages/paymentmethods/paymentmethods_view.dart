import 'package:example/pages/newcard/newcard_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PaymentMethodsView extends StatefulWidget {
  const PaymentMethodsView({super.key});

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: "PAYMENT METHOD",
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: PaymentCardColumnLayout(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: CustomButton(
                onPressed: () {
                  AutoRouter.of(context).push(NewCardViewRoute());
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewCardView()));*/
                },
                height: 50,
                text: "Add New Card"),
          ),
        ],
      ),
    );
  }
}
