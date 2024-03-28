import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/AppLocalizations.dart';
import 'package:flutter_application_1/components/api_service.dart';
import 'components/alert.dart';
import 'app/dashboard.dart';
import 'config/app.dart';
import 'login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Locale? locale =
      const Locale('ar'); // Change this to Locale('en') for English
  // Set environment here
  AppConfig.setEnvironment(Environment.DEV);
  runApp(MyApp(locale: locale));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key, this.locale}) : super(key: key);

  final Locale? locale;

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.locale;
  }

  void updateLocale(Locale newLocale) {
    setState(() {
      // Update the locale
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLogin = false;

  void changeLanguage() {
    // Get the current locale
    final currentLocale = Localizations.localeOf(context);
    // Create a new locale with the opposite language
    final newLocale = currentLocale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    // Set the new locale using MyApp's updateLocale method
    MyApp.of(context)?.updateLocale(newLocale);
  }

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final savedToken = await ApiService.getToken();
    if (savedToken != null && savedToken.isNotEmpty) {
      setState(() {
        isLogin = true;
      });
    } else {
      Alert.show(context, 'Login...!', 'error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(isLogin
            ? AppLocalizations.of(context, 'appTitle') ?? 'App'
            : AppLocalizations.of(context, 'loginTitle') ?? 'Login'),
        actions: [
          if (isLogin)
            IconButton(
              onPressed: () async {
                final success = await logoutRequest();
                if (success) {
                  setState(() {
                    isLogin = false;
                  });
                  await ApiService.removeToken();
                } else {
                  print('Logout failed');
                }
              },
              tooltip: 'Logout',
              icon: const Icon(Icons.logout),
            ),
          // Switch to change language
          IconButton(
            onPressed: changeLanguage,
            icon: const Icon(Icons.language),
            tooltip: currentLocale.languageCode == 'ar'
                ? AppLocalizations.of(context, 'English') ?? 'English'
                : AppLocalizations.of(context, 'Arabic') ?? 'Arabic',
          ),
        ],
      ),
      body: !isLogin
          ? Login(
              loginCallback: () {
                setState(() {
                  isLogin = true;
                });
              },
            )
          : Dashboard(),
    );
  }

  Future<bool> logoutRequest() async {
    try {
      final response = await ApiService.post(AppConfig.logoutUrl, {});
      return response.statusCode == 200;
    } catch (e) {
      print('Error logging out: $e');
      return false;
    }
  }
}
