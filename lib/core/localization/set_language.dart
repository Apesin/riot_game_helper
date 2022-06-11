import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'localization_constants.dart';

Locale setLanguage() {
  switch (Get.deviceLocale!.languageCode) {
    case LocalizationConstants.languageCodeTurkish:
      return LocalizationConstants.trLocale;
    case LocalizationConstants.languageCodeEnglish:
      return LocalizationConstants.enLocale;
    case LocalizationConstants.languageCodeRussian:
      return LocalizationConstants.ruLocale;
    case LocalizationConstants.languageCodeGerman:
      return LocalizationConstants.deLocale;
    case LocalizationConstants.languageCodeItalian:
      return LocalizationConstants.itLocale;
    case LocalizationConstants.languageCodeDutch:
      return LocalizationConstants.nlLocale;
    case LocalizationConstants.languageCodeFrench:
      return LocalizationConstants.frLocale;
    case LocalizationConstants.languageCodePortuguese:
      return LocalizationConstants.ptLocale;
    case LocalizationConstants.languageCodeSpanish:
      return LocalizationConstants.esLocale;
    case LocalizationConstants.languageCodeRomanian:
      return LocalizationConstants.roLocale;
    case LocalizationConstants.languageCodePolish:
      return LocalizationConstants.plLocale;
    case LocalizationConstants.languageCodeBulgarian:
      return LocalizationConstants.bgLocale;
    case LocalizationConstants.languageCodeChinese:
      return LocalizationConstants.znLocale;
    case LocalizationConstants.languageCodeJapanese:
      return LocalizationConstants.jaLocale;
    case LocalizationConstants.languageCodeKorean:
      return LocalizationConstants.koLocale;
    case LocalizationConstants.languageCodeFinnish:
      return LocalizationConstants.fiLocale;
    case LocalizationConstants.languageCodeNorwegian:
      return LocalizationConstants.nbLocale;
    case LocalizationConstants.languageCodeSwedish:
      return LocalizationConstants.svLocale;
    case LocalizationConstants.languageCodeCzech:
      return LocalizationConstants.csLocale;
    case LocalizationConstants.languageCodeLitvian:
      return LocalizationConstants.lvLocale;
    case LocalizationConstants.languageCodeLithuanian:
      return LocalizationConstants.ltLocale;
    case LocalizationConstants.languageCodeHungarian:
      return LocalizationConstants.huLocale;
    case LocalizationConstants.languageCodeGreek:
      return LocalizationConstants.elLocale;
    case LocalizationConstants.languageCodeSlovak:
      return LocalizationConstants.skLocale;
    case LocalizationConstants.languageCodeAzeri:
      return LocalizationConstants.azLocale;
    case LocalizationConstants.languageCodeUkranian:
      return LocalizationConstants.ukLocale;
    case LocalizationConstants.languageCodeGeorgian:
      return LocalizationConstants.kaLocale;
    case LocalizationConstants.languageCodeDanish:
      return LocalizationConstants.daLocale;
    case LocalizationConstants.languageCodeCroatian:
      return LocalizationConstants.hrLocale;

    default:
      return LocalizationConstants.enLocale;
  }
}