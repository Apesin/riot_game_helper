import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riot_helper/core/widgets/colors/colors.dart';
import 'package:riot_helper/core/widgets/constant_widgets.dart';
import 'package:riot_helper/core/widgets/custom_image_viewer/network_image.dart';
import 'package:sizer/sizer.dart';
import '../../../core/widgets/font/font.dart';
import 'map_degail_page.dart';

class MapsListPage extends StatelessWidget {
  const MapsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HARİTALAR',
          style: TextStyleBase.boldFont16(ProjectColor.riotWhite),
        ),
        backgroundColor: ProjectColor.colorsTransparent,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: mapList.length,
        itemBuilder: (context,index){
          var map = mapList[index];
          return GestureDetector(
            onTap: (){
              Get.to(()=>MapDetailPage(map:map));
            },
            child: Padding(
              padding: ConstantsWidget.allPadding_16,
              child: Card(
                color: ProjectColor.riotWhite.withOpacity(0.5),
                elevation: 15,
                shape: const RoundedRectangleBorder(
                  borderRadius: ConstantsWidget.borderRadius_16,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 35.h,
                      decoration:  BoxDecoration(
                          borderRadius: ConstantsWidget.borderRadius_16,
                          color: ProjectColor.riotWhite.withOpacity(0.5)),
                      child: ClipRRect(
                        borderRadius: ConstantsWidget.borderRadius_16,
                        child: CustomNetworkImage(
                          imagePath: map.mapImages[0],
                          boxFit: BoxFit.cover,
                        )
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 10.h,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16)
                          ),
                          color: ProjectColor.riotBackground.withOpacity(0.5)
                        ),
                        child: Center(
                          child: Text(map.mapName,style: TextStyleBase.boldFont16(ProjectColor.riotWhite),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

class MapModel{
  String mapName;
  List<String> mapImages;
  String mapDescription;

  MapModel({required this.mapDescription,required this.mapImages,required this.mapName});
}


List<MapModel> mapList = [
  MapModel(
    mapDescription: 'Çok gizli bir araştırma tesisi, başarısızlıkla sonuçlanan bir radyanit deneyinden sonra ikiye ayrıldı. Haritadaki farklı habitatlar sayesinde iki farklı seçime sahip olan savunanlar, saldıranları kendi bölgelerinde karşılayabilir ya da saldırıyla başa çıkabilmek için hazırlık yapabilir.',
    mapImages: ['https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltf4485163c8c5873c/6131b23e9db95e7ff74b6393/Valorant_FRACTURE_Minimap_Alpha_web.png','https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltf4485163c8c5873c/6131b23e9db95e7ff74b6393/Valorant_FRACTURE_Minimap_Alpha_web.png'],
    mapName: 'FRACTURE'
  ),
  MapModel(
    mapDescription: 'Çok gizli bir araştırma tesisi, başarısızlıkla sonuçlanan bir radyanit deneyinden sonra ikiye ayrıldı. Haritadaki farklı habitatlar sayesinde iki farklı seçime sahip olan savunanlar, saldıranları kendi bölgelerinde karşılayabilir ya da saldırıyla başa çıkabilmek için hazırlık yapabilir.',
    mapImages: ['https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt35784ce11f377ff5/6087eefd5907c910150f7588/Breeze_MapWebsite.png'],
    mapName: 'BREEZE'
  ),
  MapModel(
    mapDescription: 'Çok gizli bir araştırma tesisi, başarısızlıkla sonuçlanan bir radyanit deneyinden sonra ikiye ayrıldı. Haritadaki farklı habitatlar sayesinde iki farklı seçime sahip olan savunanlar, saldıranları kendi bölgelerinde karşılayabilir ya da saldırıyla başa çıkabilmek için hazırlık yapabilir.',
    mapImages: ['https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltde02911a015d7ef9/5f80d2851f5f6d4173b4e49d/Icebox_transparentbg_for_Web.png'],
    mapName: 'BREEZE'
  ),
  MapModel(
    mapDescription: 'Çok gizli bir araştırma tesisi, başarısızlıkla sonuçlanan bir radyanit deneyinden sonra ikiye ayrıldı. Haritadaki farklı habitatlar sayesinde iki farklı seçime sahip olan savunanlar, saldıranları kendi bölgelerinde karşılayabilir ya da saldırıyla başa çıkabilmek için hazırlık yapabilir.',
    mapImages: ['https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt8538036a309525ae/5ebc470bfd85ad7411ce6b50/bind-featured.png'],
    mapName: 'BIND'
  ),
];