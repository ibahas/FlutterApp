import 'package:flutter/material.dart';

class AppLocalizations {
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'App',
      'loginTitle': 'Login',
      'email_or_id': 'Email or ID',
      'Password': 'Password',
      'English': 'English',
      'Arabic': 'العربية'
      // Add more translations here
    },
    'ar': {
      'appTitle': 'تطبيق',
      'loginTitle': 'تسجيل الدخول',
      'email_or_id': 'البريد الإلكتروني أو الهوية',
      'Password': 'كلمة المرور',
      'English': 'English',
      'Arabic': 'العربية'
      // Add more translations here
    },
  };

  static String? of(BuildContext context, String key) {
    return _localizedValues[Localizations.localeOf(context).languageCode]?[key];
  }

  static List<Locale> get supportedLocales => const [
        Locale('en', ''),
        Locale('ar', ''),
      ];
}
