import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:riot_helper/pages/home_page.dart';
import 'package:sizer/sizer.dart';
import 'core/localization/localization_constants.dart';
import 'core/localization/set_language.dart';
import 'core/localization/translation_text.dart';
import 'core/widgets/colors/colors.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HayatHediye());
}

class HayatHediye extends StatelessWidget {
  const HayatHediye({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
          scaffoldBackgroundColor: ProjectColor.riotBackground,
        ),
        translations: TranslationText(),
        locale: setLanguage(),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          LocalizationConstants.trLocale,
          LocalizationConstants.enLocale
        ],
        navigatorKey: navigatorKey,
        home: const NewHomePage(),
      );
    });
  }
}

/*
rol images
d = https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt213441880cf2cdf5/5eaa06851b51e36d7c1b61d4/Duelist.png
c = https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt63e21ca9443dce8e/5eb270f43b09c042ddca1353/Controller.png
k = https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt72ffc2e48d4a7a58/5eaa06852b79652f27c31ff6/Sentinel.png
o = https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt2965c8a8dce0467d/5eaa0685e6f6795e530a1cbe/Initiator.png

 */

