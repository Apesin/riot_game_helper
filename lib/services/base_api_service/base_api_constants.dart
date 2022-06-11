import 'package:get/get.dart';

import '../../core/localization/localization_constants.dart';

class BaseApiConstants{
  final String apiBaseUrl = 'https://gamehelper.kodefine.com/api/';
  
  final String connectionProblemMessage = 'internetBaglantiKontrolEt'.tr;
  final String otherProblemMessage = 'beklenmedikHata'.tr;
  final String contentType = "application/json; charset=utf-8";


  final String getAgentListPath = 'valoherolist/${LocalizationConstants.deviceLocale.toString().replaceAll('_', '-')}';
  











}