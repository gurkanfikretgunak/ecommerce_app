import 'package:example/pages/paymentmethods/paymentmethods_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: "ADD NEW CARD",
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
              const CardFormLabel(),
              const SizedBox(
                height: 150,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  onPressed: () {
                    AutoRouter.of(context).push(PaymentMethodsViewRoute());
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentMethodsView()),
                    );*/
                  },
                  height: 50,
                  text: "Add Card",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
