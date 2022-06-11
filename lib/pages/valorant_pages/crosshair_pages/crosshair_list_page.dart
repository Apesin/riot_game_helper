import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riot_helper/core/widgets/constant_widgets.dart';
import 'package:riot_helper/core/widgets/custom_image_viewer/network_image.dart';

import '../../../core/widgets/colors/colors.dart';
import '../../../core/widgets/font/font.dart';

class CrossHairListPage extends StatelessWidget {
  const CrossHairListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CROSSHAIRLER',
          style: TextStyleBase.boldFont16(ProjectColor.riotWhite),
        ),
        backgroundColor: ProjectColor.colorsTransparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin: ConstantsWidget.allPadding_16,
            decoration: const BoxDecoration(
                color: ProjectColor.riotBackground2,
                borderRadius: ConstantsWidget.borderRadius_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ProjectColor.riotBackground2,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        child: CustomNetworkImage(
                          imagePath:
                              'https://preview.redd.it/7dwk00htjd451.png?width=487&format=png&auto=webp&s=ed81fc4b8f9b16d255dd37c70b08ec0c6db510be',
                          boxFit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: Text(
                          'VALORANT',
                          style: TextStyleBase.boldFont16(
                              ProjectColor.colorsWhite),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  margin: ConstantsWidget.allPadding_8,
                  padding: ConstantsWidget.allPadding_8,
                  decoration: const BoxDecoration(
                    color: ProjectColor.riotBackground2,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'CROSSHAIR CODE',
                            style: TextStyleBase.boldFont11(
                                ProjectColor.riotTextColor),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){
                              Clipboard.setData(const ClipboardData(text: '0;s;1;P;c;5;h;0;m;1;0l;4;0o;2;0a;1;0f;0;1b;0;S;c;4;o;1'));
                              HapticFeedback.lightImpact();
                            },
                            child: const Icon(
                              Icons.copy,
                              color: ProjectColor.riotWhite,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '0;s;1;P;c;5;h;0;m;1;0l;4;0o;2;0a;1;0f;0;1b;0;S;c;4;o;1',
                        style: TextStyleBase.boldFont12(ProjectColor.riotWhite),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
