import 'package:flutter/material.dart';
import 'components/AppLocalizations.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/alert.dart';
import 'config/app.dart';
import 'components/api_service.dart'; // Import the ApiService class
import 'dart:convert';
import 'main.dart';

class Login extends StatefulWidget {
  final Function() loginCallback;

  const Login({Key? key, required this.loginCallback}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String loginUrl = AppConfig.loginUrl;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkIfButtonShouldBeEnabled);
    passwordController.addListener(_checkIfButtonShouldBeEnabled);
  }

  void _checkIfButtonShouldBeEnabled() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    setState(() {
      isButtonEnabled = email.isNotEmpty && password.isNotEmpty;
    });
  }

  Future<void> loginUser(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final response = await ApiService.post(loginUrl, {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        Alert.show(context, responseData['message'], 'success');
        setState(() {
          isButtonEnabled = false;
          widget.loginCallback();
          _saveToken(responseData);
        });
      } else {
        if (response.statusCode == 401) {
          final errorMessage = json.decode(response.body)['message'];
          Alert.show(context, errorMessage, 'error');
        } else {
          Alert.show(context, 'Failed to login', 'error');
        }
      }
    } catch (e) {
      Alert.show(context, 'Error in URL !s', 'error');
    }
  }

  Future<void> _saveToken(responseData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', responseData['data']['token']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context, 'email_or_id') ??
                    'Email or ID',
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) => _checkIfButtonShouldBeEnabled(),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context, 'Password') ??
                    'Password',
                border: const OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: (_) => _checkIfButtonShouldBeEnabled(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: isButtonEnabled ? () => loginUser(context) : null,
              child: Text(AppLocalizations.of(context, 'loginTitle') ?? 'Login'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
