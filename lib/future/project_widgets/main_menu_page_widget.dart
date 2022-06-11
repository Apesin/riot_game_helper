// ignore_for_file: must_be_immutable
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_helper/core/widgets/circular_progress_indicator/custom_progress_indicator.dart';
import 'package:riot_helper/core/widgets/constant_widgets.dart';
import 'package:sizer/sizer.dart';
import '../../core/widgets/colors/colors.dart';
import '../../core/widgets/font/font.dart';
import '../../models/game_menu_model.dart';
import 'custom_square_button.dart';

enum MenuViewStyle { maxView, minView, loading }

class MainMenuPage extends StatelessWidget {
  final List<GameMenuModel> menuItemList;
  MainMenuPage({Key? key, required this.menuItemList}) : super(key: key);

  var menuViewStyle = MenuViewStyle.maxView.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
        () =>Scaffold(
      appBar: menuViewStyle.value == MenuViewStyle.minView ?
       AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                menuViewStyle(MenuViewStyle.loading);
                await Future.delayed(const Duration(milliseconds: 300));
                menuViewStyle(MenuViewStyle.maxView);
              },
              icon: const Icon(
                Icons.fullscreen,
              ),
              iconSize: 30)
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          menuItemList.length == 3 ? 'Valorant' : 'League Of Legends',
          style: TextStyleBase.boldFont16(ProjectColor.riotWhite),
        ),
      ):null,
      body:  menuViewStyle.value == MenuViewStyle.loading
            ? CustomProgresIndicator().progressInWidget()
            : menuViewStyle.value == MenuViewStyle.minView
                ? MenuMinSizeDesign(
                    menuItemList: menuItemList,
                    menuViewStyle: menuViewStyle,
                  )
                : MenuMaxSizeDesign(
                    menuItemList: menuItemList,
                    menuViewStyle: menuViewStyle,
                  ),
      ),
    );
  }
}

class MenuMinSizeDesign extends StatelessWidget {
  final List<GameMenuModel> menuItemList;
  final Rx<MenuViewStyle> menuViewStyle;
  const MenuMinSizeDesign(
      {Key? key, required this.menuItemList, required this.menuViewStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 50, top: 50),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemCount: menuItemList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: ConstantsWidget.onlyLeftRightPadding_16,
              child: GestureDetector(
                onTap: () {
                menuItemList[index].onTap();
              },
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: ConstantsWidget.borderRadius_16),
                  child: Container(
                    height: 30.h,
                    decoration: const BoxDecoration(
                        borderRadius: ConstantsWidget.borderRadius_16,
                        color: ProjectColor.riotWhite),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: ConstantsWidget.borderRadius_16,
                          child: Image.asset(
                            menuItemList[index].imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ProjectColor.riotWhite.withOpacity(0.5),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16))),
                            child: Center(
                              child: Text(
                                menuItemList[index].menuName,
                                style: TextStyleBase.boldFont20(
                                    ProjectColor.riotBackground2),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class MenuMaxSizeDesign extends StatelessWidget {
  final List<GameMenuModel> menuItemList;
  final Rx<MenuViewStyle> menuViewStyle;
  MenuMaxSizeDesign(
      {Key? key, required this.menuItemList, required this.menuViewStyle})
      : super(key: key);

  final SwiperController controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _menuItemBackgroundImageWidget(),
        _menuItemCategoryNameWidget(),
        _customPaginationBackgroundColorWidget()
      ],
    );
  }

  _menuItemBackgroundImageWidget() {
    return AnimatedContainer(
      duration: const Duration(days: 1),
      height: 100.h,
      width: 100.w,
      child: Swiper(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                menuItemList[index].onTap();
              },
              child: Image.asset(
                menuItemList[index].imagePath,
                fit: BoxFit.cover,
              ));
        },
        axisDirection: AxisDirection.up,
        scrollDirection: Axis.vertical,
        itemCount: menuItemList.length,
        pagination: const SwiperPagination(
          alignment: Alignment.centerRight,
          builder: DotSwiperPaginationBuilder(
            activeColor: ProjectColor.riotWhite,
            activeSize: 20,
            size: 10,
            color: ProjectColor.riotBackground,
          ),
        ),
        //controller: controller,
        onIndexChanged: (value) {
          controller.move(value);
        },
        loop: false,
        control: const SwiperControl(
          color: ProjectColor.colorsWhite,
          padding: EdgeInsets.only(bottom: 25),
          size: 35,
        ),
      ),
    );
  }

  Positioned _customPaginationBackgroundColorWidget() {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      child: Center(
        child: Container(
          height: (menuItemList.length * 10) + 70,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            color: ProjectColor.riotBackground.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Positioned _menuItemCategoryNameWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      height: 20.h,
      child: Stack(
        children: [
          Swiper(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  menuItemList[index].onTap();
                },
                child: Container(
                  width: 100.w,
                  height: 10.h,
                  color: ProjectColor.riotBackground.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      menuItemList[index].menuName,
                      style: TextStyleBase.boldFont20(ProjectColor.colorsWhite),
                    ),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: menuItemList.length,
            controller: controller,
          ),
          _backButton(),
          _menuViewChangeButton()
        ],
      ),
    );
  }

  Positioned _backButton() {
    return const Positioned(
      left: 8,
      top: 0,
      bottom: 0,
      child: Center(child: CustomSquareButton()),
    );
  }

  Positioned _menuViewChangeButton() {
    return Positioned(
      right: 8,
      top: 0,
      bottom: 0,
      child: Center(
        child: CustomSquareButton(
          buttonIcon: Icons.fullscreen_exit,
          onTapFunction: () async {
            menuViewStyle(MenuViewStyle.loading);
            await Future.delayed(const Duration(milliseconds: 300));
            menuViewStyle(MenuViewStyle.minView);
          },
        ),
      ),
    );
  }
}
