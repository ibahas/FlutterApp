import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'drawer.dart';
import 'package:flutter_application_1/screen1.dart';
import 'package:flutter_application_1/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: null,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        Screen1.routeName: (context) => const Screen1(),
        Screen2.routeName: (context) => const Screen2(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 300,
              transform: Matrix4.rotationZ(-20 * (pi / 180))
                ..translate(0.0, _value, 0),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrange.shade900,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 2),
                    color: Colors.black26,
                  ),
                ],
              ),
              child: const Text(
                'MyShop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
            Slider(
              value: _value,
              onChanged: (val) => setState(() => _value = val),
              min: 0,
              max: pi * 2,
            ),
          ],
        ),
        drawerScrimColor: Colors.pinkAccent.withOpacity(0.3),
        drawer: const MyDrawer(),
      ),
    );
  }
}
