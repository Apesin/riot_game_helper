import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_helper/core/widgets/colors/colors.dart';
import 'package:riot_helper/core/widgets/font/font.dart';
import 'package:riot_helper/main.dart';
import 'package:sizer/sizer.dart';
import '../../../future/project_widgets/agent_detail_widgets/bottom_sheet_skill_detail_widget.dart';
import '../../../models/agent_list_model.dart';

class AgentDetailsPage extends StatefulWidget {
  final Agent agent;
  const AgentDetailsPage({Key? key, required this.agent}) : super(key: key);

  @override
  State<AgentDetailsPage> createState() => _AgentDetailsPageState();
}

class _AgentDetailsPageState extends State<AgentDetailsPage> {
  static AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.play(widget.agent.voicePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: () async {
          player.stop();
          return true;
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_skillPageImageArea(), _skillPageDetailArea(context)],
          ),
        ),
      ),
    );
  }

  

  Container _skillPageImageArea() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, top: 60),
      height: 400,
      width: double.infinity,
      color: Color(int.parse(widget.agent.backgroundColor)),
      child: Stack(
        children: [
          Positioned(
            left: widget.agent.agentLookingLeft ? null : -35,
            right: widget.agent.agentLookingLeft ? -35 : null,
            top: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.network(
                widget.agent.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            color:
                Color(int.parse(widget.agent.backgroundColor)).withOpacity(0.7),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Image.network(
                widget.agent.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            color:
                Color(int.parse(widget.agent.backgroundColor)).withOpacity(0.6),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: widget.agent.agentLookingLeft ? 0 : 50.w,
              right: widget.agent.agentLookingLeft ? 50.w : 0,
            ),
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.network(
                widget.agent.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: widget.agent.agentLookingLeft ? 30 : null,
            left: widget.agent.agentLookingLeft ? null : 30,
            bottom: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.agent.displayName,
                  style: TextStyleBase.boldFont20(ProjectColor.colorsWhite),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ProjectColor.riotBackground2.withOpacity(0.5)),
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 8, bottom: 8),
                  child: Text(
                    widget.agent.role,
                    style: TextStyleBase.normalFont12(
                      Color(int.parse(widget.agent.backgroundColor)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _skillPageDetailArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'yasamOykusu'.tr,
            style: TextStyleBase.boldFont14(ProjectColor.riotTextColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.agent.description,
            style: TextStyleBase.normalFont11(ProjectColor.riotGrey),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'ozelYetenekleri'.tr,
            style: TextStyleBase.boldFont14(ProjectColor.riotTextColor),
          ),
          const SizedBox(
            height: 8,
          ),
          for (var i = 0; i < widget.agent.abilities.length; i++)
            _skillWidget(context: context, ability: widget.agent.abilities[i]),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  GestureDetector _skillWidget(
      {required Ability ability, required BuildContext context}) {
    return GestureDetector(
      onTap: () async => _showSkillBottomSheet(ability),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(8),
            height: 75,
            decoration: BoxDecoration(
                color: ProjectColor.riotBackground2,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                _skillImage(ability),
                const SizedBox(
                  width: 12,
                ),
                _skillTitleAndContent(ability),
              ],
            ),
          ),
          _playButton(ability),
        ],
      ),
    );
  }

  Container _skillImage(Ability ability) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 59,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ProjectColor.riotBackground),
      child: Image.network(ability.icon),
    );
  }

  Expanded _skillTitleAndContent(Ability ability) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ability.slot + ' - ' + ability.displayName,
            style: TextStyleBase.boldFont11(ProjectColor.riotWhite),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            ability.description,
            style: TextStyleBase.normalFont11(ProjectColor.riotTextColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _playButton(Ability ability) {
    return ability.slot.length < 2
        ? const Positioned(
            right: 8,
            top: 8,
            child: Icon(
              Icons.play_arrow,
              color: ProjectColor.riotWhite,
            ),
          )
        : const SizedBox();
  }

  _showSkillBottomSheet(Ability ability) {
    if (ability.slot.length < 2) {
      showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          backgroundColor: ProjectColor.colorsTransparent,
          context: navigatorKey.currentContext!,
          builder: (context) {
            return DraggableScrollableSheet(
              maxChildSize: 0.85,
              minChildSize: 0.35,
              initialChildSize: 0.50,
              builder: (_, controller) {
                return BottomSheetSkillDetailWidget(
                  ability: ability,
                  controller: controller,
                );
              },
            );
          });
    }
  }
}
