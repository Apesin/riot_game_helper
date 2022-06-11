import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:riot_helper/core/widgets/colors/colors.dart';
import '../../core/widgets/font/font.dart';
import '../../future/project_widgets/main_menu_page_widget.dart';
import '../../models/game_menu_model.dart';

class LOLHomePage extends StatelessWidget {
  const LOLHomePage({Key? key}) : super(key: key);

  static SwiperController controller = SwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainMenuPage(
        menuItemList: lolMenuItem,
      ),
    );
  }
}
