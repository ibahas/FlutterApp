import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter app',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        cardColor: Colors.pinkAccent,
        appBarTheme: const AppBarTheme(
          color: Colors.green,
          titleTextStyle: TextStyle(fontFamily: 'DejaVuSansMono-BoldOblique'),
        ),
        fontFamily: 'Galexica',
        // colorSchemeSeed: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  // Container info(String title, Color color) {
  Widget info(String title, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Text(title, style: const TextStyle(fontSize: 30)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.yellowAccent,
        title: const Text('AppBar title'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: <Widget>[
            // Text('1'),
            // Text('2'),
            // Text('3'),
            info('Title 1', Colors.red),
            info('Title 2', Colors.pinkAccent),
            info('Title 3', Colors.green),
            info('Title 4', Colors.amber),
            info('Title 5', Colors.black),
            info('Title 6', Colors.transparent),
            info('Title 1', Colors.red),
            info('Title 2', Colors.pinkAccent),
            info('Title 3', Colors.green),
            info('Title 4', Colors.amber),
            info('Title 5', Colors.black),
            info('Title 6', Colors.transparent),
          ],
        ),
      ),
    );
  }
}
