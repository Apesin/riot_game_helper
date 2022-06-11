// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_helper/core/constants/asset_constants.dart';
import 'package:riot_helper/core/widgets/circular_progress_indicator/custom_progress_indicator.dart';
import 'package:riot_helper/core/widgets/colors/colors.dart';
import 'package:riot_helper/core/widgets/constant_widgets.dart';
import 'package:riot_helper/core/widgets/custom_image_viewer/network_image.dart';
import 'package:riot_helper/core/widgets/font/font.dart';
import 'package:riot_helper/services/agent_services/agent_services.dart';
import '../../../future/project_widgets/gridview_custom_height.dart';
import '../../../models/agent_list_model.dart';
import 'agent_detail_page.dart';

class AgengtsListPage extends StatelessWidget {
  const AgengtsListPage({Key? key}) : super(key: key);

  static var itemCount = 2.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor.riotBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AJANLAR',
          style: TextStyleBase.boldFont16(ProjectColor.riotWhite),
        ),
        backgroundColor: ProjectColor.colorsTransparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // if (itemCount.value == 1) {
              //   itemCount(2);
              //   itemHeight(200.0);
              // } else {
              //   itemCount(1);
              //   itemHeight(400.0);
              // }
              showModalBottomSheet(
                  backgroundColor: ProjectColor.colorsTransparent,
                  context: context,
                  builder: (context) {
                    return AgentListBottomSheet(
                      itemCount: itemCount,
                    );
                  });
            },
            icon: const Icon(
              Icons.filter_list,
              color: ProjectColor.riotWhite,
              size: 30,
            ),
          )
        ],
      ),
      body: FutureBuilder<AgentListModel>(
          future: AgentServices().getAgentList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomProgresIndicator().progressInWidget();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Obx(
                    () => GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                              crossAxisCount: itemCount.value,
                              height: itemCount.value == 1 ? 400 : 200,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 38),
                      itemCount: snapshot.data!.item.length,
                      itemBuilder: (BuildContext context, int index) {
                        var agent = snapshot.data!.item[index];
                        return Padding(
                          padding: itemCount.value == 2
                              ? EdgeInsets.only(
                                  left: index % 2 == 0 ? 8 : 0,
                                  right: index % 2 != 0 ? 8 : 0,
                                )
                              : const EdgeInsets.all(14),
                          child: AgentListWidget(
                            agent: agent,
                            itemCount: itemCount,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              );
            }
            return const Center(
              child: Text('Error'),
            );
          }),
    );
  }
}

class AgentListBottomSheet extends StatelessWidget {
  RxInt itemCount;
  AgentListBottomSheet({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: const BoxDecoration(
        color: ProjectColor.riotBackground2,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Padding(
        padding: ConstantsWidget.allPadding_16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _itemViewChangeWidgets(),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Rollere Göre',
              style: TextStyleBase.boldFont18(ProjectColor.riotWhite),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 75,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: agentRoleImagePath.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 75,
                    width: 75,
                    margin: const EdgeInsets.only(right: 8),
                    padding: ConstantsWidget.allPadding_16,
                    decoration: BoxDecoration(
                      borderRadius: ConstantsWidget.borderRadius_5,
                      color: ProjectColor.riotWhite.withOpacity(0.1),
                    ),
                    child: Image.asset(agentRoleImagePath[index])
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _itemViewChangeWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Görünüm',
          style: TextStyleBase.boldFont18(ProjectColor.riotWhite),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            _styleChangeButton(
              selectedItemId: 2,
              buttonIcon: Icons.drag_indicator,
              onTap: () {
                itemCount(2);
              },
            ),
            const SizedBox(
              width: 12,
            ),
            _styleChangeButton(
              selectedItemId: 1,
              buttonIcon: Icons.reorder,
              onTap: () {
                itemCount(1);
              },
            ),
          ],
        )
      ],
    );
  }

  _styleChangeButton(
      {required IconData buttonIcon,
      required Function onTap,
      required int selectedItemId}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Obx(() => Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: ConstantsWidget.borderRadius_5,
                color: ProjectColor.riotWhite.withOpacity(
                    selectedItemId == itemCount.value ? 0.5 : 0.1)),
            child: Center(
              child: Icon(
                buttonIcon,
                color: ProjectColor.riotWhite,
                size: 30,
              ),
            ),
          )),
    );
  }
}

class AgentListWidget extends StatelessWidget {
  final Agent agent;
  final RxInt itemCount;
  const AgentListWidget(
      {Key? key, required this.agent, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AgentDetailsPage(
              agent: agent,
            ));
      },
      child: SizedBox(
        height: itemCount.value == 1 ? 400 : 200,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Card(
                elevation: 26,
                shadowColor: Color(int.parse(agent.backgroundColor)),//agent.backgroundColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        topLeft: Radius.circular(35),
                        topRight: Radius.elliptical(130, 96))),
                child: Container(
                  height: itemCount.value == 1 ? 400 : 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(int.parse(agent.backgroundColor)),//agent.backgroundColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      topLeft: Radius.circular(35),
                      topRight: Radius.elliptical(130, 96),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: itemCount.value == 1 ? 400 : 200,
              width: double.infinity,
              color: Colors.transparent,
              child: CustomNetworkImage(
                imagePath: agent.image,
                boxFit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              left: 20,
              bottom: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agent.displayName,
                    style: TextStyleBase.boldFont14(ProjectColor.riotWhite),
                  ),
                  Text(
                    agent.role,
                    style: TextStyleBase.normalFont12(ProjectColor.riotWhite),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


List agentRoleImagePath = [
  AssetsConstants.agentRoleController,
  AssetsConstants.agentRoleDuelist,
  AssetsConstants.agentRoleInitiator,
  AssetsConstants.agentRoleSentinel
];