import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<http.Response> post(String url, dynamic body) async {
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
  }

  static Future<http.Response> get(String url) async {
    final token = await getToken();
    final headers = {
      'Authorization': 'Bearer $token',
    };

    return await http.get(Uri.parse(url), headers: headers);
  }

  static Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
