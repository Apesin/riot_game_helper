import 'package:card_swiper/card_swiper.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_helper/core/widgets/colors/colors.dart';
import 'package:riot_helper/core/widgets/constant_widgets.dart';
import 'package:riot_helper/future/project_widgets/custom_image_viewer.dart';
import '../../../core/widgets/font/font.dart';
import '../../../main.dart';
import 'maps_list_page.dart';

class MapDetailPage extends StatelessWidget {
  final MapModel map;
  const MapDetailPage({Key? key, required this.map}) : super(key: key);
  static int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: ProjectColor.colorsTransparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: ProjectColor.riotBackground.withOpacity(0.5),
                borderRadius: ConstantsWidget.borderRadius_5,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: ProjectColor.riotBackground.withOpacity(0.5),
                borderRadius: ConstantsWidget.borderRadius_5,
              ),
              child: GestureDetector(
                onTap: () {
                  _imageViewer(
                    currentIndex: currentIndex,
                    imageList: map.mapImages
                  );
                },
                child: const Icon(
                  Icons.zoom_out_map_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: ProjectColor.riotWhite,
              child: Stack(
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Swiper(
                      physics: const BouncingScrollPhysics(),
                      loop: false,
                      onIndexChanged: (index){
                        currentIndex = index;
                      },
                      itemCount: map.mapImages.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          map.mapImages[index],
                          fit: BoxFit.cover,
                        );
                      },
                      pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          activeColor: ProjectColor.riotDarkRed,
                          activeSize: 20,
                          color: ProjectColor.riotBackground,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          map.mapName,
                          style: TextStyleBase.boldFont20(
                              ProjectColor.colorsWhite),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '// HARİTANIN HİKAYESİ',
                    style: TextStyleBase.boldFont14(ProjectColor.riotTextColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    map.mapDescription,
                    style: TextStyleBase.normalFont11(ProjectColor.riotGrey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _imageViewer({required List<String> imageList,required int currentIndex}) {
    CustomImageViewer customImageProvider = CustomImageViewer(
      imageUrls: imageList,
      initialIndex: currentIndex,
    );
    showImageViewerPager(navigatorKey.currentContext!, customImageProvider,
        onPageChanged: (page) {
      // print("Page changed to $page");
    }, onViewerDismissed: (page) {
      // print("Dismissed while on page $page");
    });
  }
}
