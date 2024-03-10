import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';
import 'package:flutter_application_1/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //From this
      home: null,
      initialRoute: '/',
      routes: {
        //Or this
        '/': (context) => const MyHomePage(),
        // When navigating to the "/" route, build the FirstScreen widget.
        Screen1.routeName: (context) => const Screen1(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        Screen2.routeName: (context) => const Screen2(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void selectScreen(BuildContext context, screenClass) {
    Navigator.of(context).pushNamed(
      screenClass,
      arguments: {
        'id': 10,
        'title': 'info screen $screenClass',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: const Text(
                'Screen 1',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => selectScreen(context, Screen1.routeName),
            ),
            InkWell(
              child: const Text(
                'Screen 2',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => selectScreen(context, Screen2.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
