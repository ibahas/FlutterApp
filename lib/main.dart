// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/info.dart';
import 'package:flutter_application_1/text.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/widgets.dart';
// import 'text.dart';

// import 'package:flutter_application_1/lesson_three.dart';
// import 'package:flutter_application_1/lesson_one.dart';
// import 'package:flutter_application_1/lesson_two.dart';

void main() => runApp(const MyApp());

Color w = Colors.white;
Color b = Colors.black;
Color g = Colors.greenAccent;

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
  final List<Info> li = [
    Info(name: 'Ibrahim1', height: 170, date: DateTime.now()),
    Info(name: 'Ibrahim2', height: 175, date: DateTime.now()),
    Info(name: 'Ibrahim3', height: 180, date: DateTime.now()),
    Info(name: 'Ibrahim4', height: 190, date: DateTime.now()),
    Info(name: 'Ibrahim5', height: 195, date: DateTime.now()),
    Info(name: 'Ibrahim6', height: 195, date: DateTime.now()),
    Info(name: 'Ibrahim7', height: 195, date: DateTime.now()),
    Info(name: 'Ibrahim8', height: 195, date: DateTime.now()),
    Info(name: 'Ibrahim9', height: 195, date: DateTime.now()),
  ];

  void x(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        backgroundColor: Colors.white60,
        anchorPoint: const Offset(100, 300),
        builder: (_) {
          return ListView.builder(
            itemCount: li.length, //Or count if item need to show it.
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Card(
                  color: Theme.of(ctx).cardColor,
                  shadowColor: w,
                  elevation: 10,
                  //Or container
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            MyText(li[index].name, s20),
                            MyText(' ${li[index].height}', s20),
                          ],
                        ),
                        MyText(' ${DateFormat().format(li[index].date)}', s24)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.yellowAccent,
        title: Text(
          'AppBar title',
          style: TextStyle(
            color: b,
          ),
        ),
      ),
      body: Container(
        // mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.center,
        height: double.infinity,
        color: w,
        child: Column(
          children: [
            Image.network(
              'https://static.vecteezy.com/system/resources/thumbnails/025/181/412/small/picture-a-captivating-scene-of-a-tranquil-lake-at-sunset-ai-generative-photo.jpg',
              height: 200,
              width: 300,
              // fit: BoxFit.cover, for Column
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/icons/user.png',
              fit: BoxFit.fill,
              height: 400,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => x(context),
        backgroundColor: w,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            side: BorderSide(
              color: w,
              width: 6,
              style: BorderStyle.solid,
            )),
        child: const Icon(Icons.notifications),
        // splashColor: Colors.green,
      ),
    );
  }
}
