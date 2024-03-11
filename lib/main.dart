import 'package:flutter/material.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: _value,
              height: _value,
            ),
            Text('Value: ${(_value).round()}'),
            Slider(
              value: _value,
              onChanged: (double val) => setState(() => _value = val),
              min: 0,
              max: 500,
              inactiveColor: Colors.red,
              activeColor: Colors.greenAccent,
              divisions: 100,
              label: 'Value',
            )
          ],
        ),
        drawerScrimColor: Colors.pinkAccent.withOpacity(0.3),
        drawer: const MyDrawer(),
      ),
    );
  }
}
