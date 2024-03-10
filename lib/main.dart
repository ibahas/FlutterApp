import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';
import 'package:flutter_application_1/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void selectScreen(BuildContext context, int n) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      if (n == 1) {
        return const screen1();
      }
      return const screen2();
    }));
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
            child:
                const Text('Screen 1', style: TextStyle(color: Colors.black)),
            onTap: () => {
              selectScreen(context, 1),
            },
          ),
          InkWell(
            child:
                const Text('Screen 2', style: TextStyle(color: Colors.black)),
            onTap: () => {
              selectScreen(context, 2),
            },
          ),
        ],
      )),
    );
  }
}
