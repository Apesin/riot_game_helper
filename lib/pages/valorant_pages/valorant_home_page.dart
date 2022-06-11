import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../future/project_widgets/main_menu_page_widget.dart';
import '../../models/game_menu_model.dart';

class ValorantHomePage extends StatelessWidget {
  const ValorantHomePage({Key? key}) : super(key: key);

  static SwiperController controller = SwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainMenuPage(
        menuItemList: valorantMenuItem,
      ),
    );
  }
}



