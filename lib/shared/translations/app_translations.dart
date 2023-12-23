import 'package:get/get.dart';

import 'en_us_translation.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUs,
      };
}
