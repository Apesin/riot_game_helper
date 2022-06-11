import 'package:get/get.dart';
import 'package:riot_helper/core/constants/asset_constants.dart';

import '../pages/valorant_pages/agents_page/agents_list_page.dart';
import '../pages/valorant_pages/crosshair_pages/crosshair_list_page.dart';
import '../pages/valorant_pages/maps_page/maps_list_page.dart';

class GameMenuModel {
  String imagePath;
  String menuName;
  Function onTap;

  GameMenuModel(
      {required this.imagePath, required this.menuName, required this.onTap});
}

List<GameMenuModel> valorantMenuItem = [
  GameMenuModel(
      onTap: () {
        Get.to(() => const AgengtsListPage());
      },
      imagePath:
          AssetsConstants.valorantMenuAgents,
      menuName: 'AJANLAR'),
  GameMenuModel(
      onTap: () {
        Get.to(() => const CrossHairListPage());
      },
      imagePath:
          AssetsConstants.valorantMenuCrossHairs,
      menuName: 'CROSSHAIR'),
  GameMenuModel(
      onTap: () {
        Get.to(() => const MapsListPage());
      },
      imagePath: AssetsConstants.valorantMenuMaps,
      menuName: 'HARITALAR'),
];

List<GameMenuModel> lolMenuItem = [
  GameMenuModel(
      onTap: () {
        Get.to(() => const AgengtsListPage());
      },
      imagePath:
          AssetsConstants.lolMenuHeroes,
      menuName: 'ŞAMPİYONLAR'),
  GameMenuModel(
      onTap: () {
        Get.to(() => const CrossHairListPage());
      },
      imagePath:
          AssetsConstants.lolMenuShop,
      menuName: 'EŞYALAR'),
];
