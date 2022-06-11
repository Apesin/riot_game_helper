import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/widgets/colors/colors.dart';
import '../../../core/widgets/font/font.dart';
import '../../../models/agent_list_model.dart';
import 'skill_video_player.dart';

class BottomSheetSkillDetailWidget extends StatelessWidget {
  final Ability ability;
  final ScrollController? controller;
  const BottomSheetSkillDetailWidget({Key? key, required this.ability,required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Container(
        height: 85.h,
        decoration: const BoxDecoration(
          color: ProjectColor.riotBackground2,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 25,
              height: 6,
              decoration: BoxDecoration(
                  color: ProjectColor.riotGrey,
                  borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 16,
            ),
            SkillVideoPlayer(videoPath: ability.video,),
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ability.slot + ' - ' + ability.displayName,
                    style: TextStyleBase.boldFont16(ProjectColor.riotWhite),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    ability.description,
                    style: TextStyleBase.normalFont12(ProjectColor.riotTextColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}