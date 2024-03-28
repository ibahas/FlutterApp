import 'package:flutter/foundation.dart';

class AppConfig {
  static String baseUrl = '';

  static String homeUrl = '';
  static String loginUrl = '';
  static String logoutUrl = '';
  static String groupsUrl = '';
  static String auditsUrl = '';
  static String ip = '172.24.96.1';
  // Add more URLs as needed...

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        baseUrl = 'http://$ip/api';
        break;
      case Environment.STAGING:
        baseUrl = 'http://$ip/api';
        break;
      case Environment.PROD:
        baseUrl = 'http://$ip/api';
        break;
    }

    // Define URLs based on the base URL
    homeUrl = '$baseUrl/home';
    loginUrl = '$baseUrl/login';
    logoutUrl = '$baseUrl/logout';
    groupsUrl = '$baseUrl/groups';
    auditsUrl = '$baseUrl/audits';

    // Define more URLs similarly...
  }
}

// ignore: constant_identifier_names
enum Environment { DEV, STAGING, PROD }
