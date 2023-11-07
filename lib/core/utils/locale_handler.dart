import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/core/localization/i18n/translations.g.dart';
import 'package:flutter_boilerplate/features/home_feature/data/data_sources/local/home_storage.dart';

class LocaleHandler {
  Future<AppLocale> getLocale() async {
    final String storedLocale = await HomeStorage().getLanguageLocale() ?? '';
    if (storedLocale == '') {
      return AppLocale.fa;
    }
    if (storedLocale == 'fa') {
      return AppLocale.fa;
    } else {
      return AppLocale.en;
    }
  }

  void changeLocale(final BuildContext context) {
    if (checkEnState(context)) {
      LocaleSettings.setLocale(AppLocale.fa);
      HomeStorage().setLanguageLocale('fa');
    } else {
      LocaleSettings.setLocale(AppLocale.en);
      HomeStorage().setLanguageLocale('en');
    }
  }
}

bool checkEnState(final BuildContext context) {
  try {
    if (TranslationProvider.of(context).flutterLocale == const Locale('en')) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
