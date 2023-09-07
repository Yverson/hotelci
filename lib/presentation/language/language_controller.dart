import 'package:hotel_ci/core/app_export.dart';

class LanguageController extends GetxController {
  RxString lang = LocalizationService.langs.first.obs;
}
