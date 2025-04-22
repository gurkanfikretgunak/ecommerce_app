import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/cubits/locale/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: L10n.of(context)!.language,
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: BlocBuilder<LocaleCubit, Locale>(builder: (context, locale) {
        final currentLanguage = locale.languageCode;

        return ListView(
          children: [
            ListTile(
              title: ContentText(
                text: L10n.of(context)!.turkish,
                fontSize: 18,
                textAlign: TextAlign.start,
                color: ColorConstant.instance.neutral1,
              ),
              trailing: currentLanguage == 'tr'
                  ? Icon(Icons.check,
                      color: ColorConstant.instance.primary_main)
                  : null,
              onTap: () {
                context.read<LocaleCubit>().changeLocale(const Locale('tr'));
              },
            ),
            const Divider(),
            ListTile(
              title: ContentText(
                text: L10n.of(context)!.english,
                fontSize: 18,
                textAlign: TextAlign.start,
                color: ColorConstant.instance.neutral1,
              ),
              trailing: currentLanguage == 'en'
                  ? Icon(Icons.check,
                      color: ColorConstant.instance.primary_main)
                  : null,
              onTap: () {
                context.read<LocaleCubit>().changeLocale(const Locale('en'));
              },
            ),
          ],
        );
      }),
    );
  }
}
