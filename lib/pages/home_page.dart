import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_helper/core/widgets/circular_progress_indicator/custom_progress_indicator.dart';
import 'package:riot_helper/pages/valorant_pages/valorant_home_page.dart';
import 'package:sizer/sizer.dart';
import '../core/constants/asset_constants.dart';
import '../core/widgets/colors/colors.dart';
import '../core/widgets/constant_widgets.dart';
import '../core/widgets/font/font.dart';
import '../future/project_widgets/login_page_video_player_widget.dart';
import 'lol_pages/lol_home_page.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({Key? key}) : super(key: key);

  static var valorantVideoStatus = FlipAnimationVideoStatus.stop.obs;
  static var lolVideoStatus = FlipAnimationVideoStatus.stop.obs;

  static FlipCardController valorantFlipController = FlipCardController();
  static FlipCardController lolFlipController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsConstants.homePageBackground,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                  child: Material(
                    color: Colors.transparent,
                    elevation: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              height: 15.h,
                              width: 35.w,
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset(AssetsConstants.riotLogo)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _titleText('RIOT'),
                                _titleText('GAMES'),
                                _titleText('HELPER'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                FlipCard(
                  controller: valorantFlipController,
                  onFlipDone: (value) {
                    if (value) {
                      valorantVideoStatus(FlipAnimationVideoStatus.play);
                      if (lolVideoStatus.value ==
                          FlipAnimationVideoStatus.play) {
                        lolFlipController.toggleCard();
                      }
                    } else {
                      valorantVideoStatus(FlipAnimationVideoStatus.stop);
                    }
                  },
                  fill: Fill.fillBack,
                  direction: FlipDirection.VERTICAL,
                  front: _cardFrontWidget(
                    logoPath: AssetsConstants.valorantLogo,
                  ),
                  back: _cardBackWidget(
                    videoStatus: valorantVideoStatus,
                    videoPath: AssetsConstants.valorantVideo,
                    logoPath: AssetsConstants.valorantLogo,
                    onTapFunction: () => Get.to(() => const ValorantHomePage()),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FlipCard(
                  onFlipDone: (value) {
                    if (value) {
                      lolVideoStatus(FlipAnimationVideoStatus.play);
                      if (valorantVideoStatus.value ==
                          FlipAnimationVideoStatus.play) {
                        valorantFlipController.toggleCard();
                      }
                    } else {
                      lolVideoStatus(FlipAnimationVideoStatus.stop);
                    }
                  },
                  controller: lolFlipController,
                  fill: Fill.fillBack,
                  direction: FlipDirection.VERTICAL,
                  front: SafeArea(
                    bottom: true,
                    top: false,
                    child: _cardFrontWidget(
                      logoPath: AssetsConstants.lolLogo,
                    ),
                  ),
                  back: SafeArea(
                    bottom: true,
                    top: false,
                    child: _cardBackWidget(
                      videoStatus: lolVideoStatus,
                      videoPath: AssetsConstants.lolVideo,
                      logoPath: AssetsConstants.lolLogo,
                      onTapFunction: () => Get.to(() => const LOLHomePage()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardBackWidget(
      {required String videoPath,
      required String logoPath,
      required Function onTapFunction,
      required Rx<FlipAnimationVideoStatus> videoStatus}) {
    return Padding(
      padding: ConstantsWidget.onlyLeftRightPadding_16,
      child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: ConstantsWidget.borderRadius_16,
          ),
          color: ProjectColor.riotBackground2,
          child: Obx(
            () => SizedBox(
              height: 20.h,
              width: 100.w,
              child: videoStatus.value == FlipAnimationVideoStatus.play
                  ? LoginPageVideoPlayerWidget(
                      videoPath: videoPath,
                      logoPath: logoPath,
                      onTapFunction: () => onTapFunction(),
                    )
                  : CustomProgresIndicator().progressInWidget(),
            ),
          )),
    );
  }

  Widget _cardFrontWidget({
    required String logoPath,
  }) {
    return Padding(
      padding: ConstantsWidget.onlyLeftRightPadding_16,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: ConstantsWidget.borderRadius_16,
        ),
        color: ProjectColor.riotBackground2,
        child: SizedBox(
          height: 20.h,
          width: 100.w,
          child: Padding(
            padding: ConstantsWidget.allPadding_45,
            child: Image.asset(logoPath),
          ),
        ),
      ),
    );
  }

  _titleText(String text) {
    return Text(
      text,
      style: TextStyleBase.boldFont20(ProjectColor.riotWhite),
    );
  }
}

enum FlipAnimationVideoStatus { play, stop }
