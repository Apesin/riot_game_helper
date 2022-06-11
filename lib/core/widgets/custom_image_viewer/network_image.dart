import 'package:cached_network_image/cached_network_image.dart';
import 'package:riot_helper/core/widgets/colors/colors.dart';

import '/core/constants/asset_constants.dart';
import '/core/constants/base_item_colors.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imagePath;
  final BoxFit boxFit;
  const CustomNetworkImage(
      {required this.imagePath, this.boxFit = BoxFit.fill, Key? key})
      : super(key: key);

  static final BaseItemColors _baseItemColors = BaseItemColors();

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath == "") {
      return _errorImage();
    } else {
      return CachedNetworkImage(
        imageUrl: imagePath!,
        fit: boxFit,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
          value: downloadProgress.progress,
          backgroundColor: _baseItemColors.baseWhiteColor,
          color: ProjectColor.riotBackground,
        )),
        errorWidget: (context, url, error) => _errorImage(),
      );
    }
  }

  Widget _errorImage() {
    return Container(
      color: _baseItemColors.progresIndicatorColor,
      child: Center(
        child: Image.asset(AssetsConstants.imageLoadingFailed),
      ),
    );
  }
}
