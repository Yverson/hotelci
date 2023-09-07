import 'package:hotel_ci/localization/ar.dart';
import 'package:hotel_ci/localization/en.dart';
import 'package:hotel_ci/localization/es.dart';
import 'package:hotel_ci/localization/et.dart';
import 'package:hotel_ci/localization/fi.dart';
import 'package:hotel_ci/localization/fr.dart';
import 'package:hotel_ci/localization/gu.dart';
import 'package:hotel_ci/localization/hi.dart';
import 'package:hotel_ci/localization/id.dart';
import 'package:hotel_ci/localization/ru.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('fr');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('fr');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Estonian',
    'Russian',
    'Finnish',
    'Hindi',
    'Gujarati',
    'arabic',
    'Spanish',
    'Indonesian',
    'French',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en'),
    const Locale('et'),
    const Locale('ru'),
    const Locale('fi'),
    const Locale('hi'),
    const Locale('gu'),
    const Locale('ar'),
    const Locale('es'),
    const Locale('id'),
    const Locale('fr'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enTranslation,
        'et': etTranslation,
        'ru': ruTranslation,
        'fi': fiTranslation,
        'hi': hiTranslation,
        'gu': guTranslation,
        'ar': arTranslation,
        'es': esTranslation,
        'id': idTranslation,
        'fr': frTranslation,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
