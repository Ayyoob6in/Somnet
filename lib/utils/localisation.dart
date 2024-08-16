import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Custom MaterialLocalizations for Somali
class CustomMaterialLocalizationsSo extends DefaultMaterialLocalizations {
  @override
  String get okButtonLabel => 'Haa';

  @override
  String get cancelButtonLabel => 'Ka noqo';

  // Add more overrides for other Material localization strings as needed
}

// Custom CupertinoLocalizations for Somali
class CustomCupertinoLocalizationsSo extends DefaultCupertinoLocalizations {
  @override
  String get alertDialogLabel => 'Digniin';

  @override
  String get todayLabel => 'Maanta';

  // Add more overrides for other Cupertino localization strings as needed
}

class CustomLocalizationDelegates
    extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationDelegates();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'so';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return SynchronousFuture(CustomMaterialLocalizationsSo());
  }

  @override
  bool shouldReload(CustomLocalizationDelegates old) => false;
}

class CustomCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const CustomCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'so';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    return SynchronousFuture(CustomCupertinoLocalizationsSo());
  }

  @override
  bool shouldReload(CustomCupertinoLocalizationsDelegate old) => false;
}
