// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/info.dart';
import 'package:flutter_application_1/text.dart';
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

  // final x1 = Info(name: 'Ibrahim1', height: 175, date: DateTime.now());
  // final x2 = Info(name: 'Ibrahim2', height: 180, date: DateTime.now());
  // final x3 = Info(name: 'Ibrahim3', height: 185, date: DateTime.now());
  // final x4 = Info(name: 'Ibrahim4', height: 190, date: DateTime.now());
  // final x5 = Info(name: 'Ibrahim5', height: 195, date: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text(
          'AppBar title',
          style: TextStyle(
            color: b,
          ),
        ),
      ),
      body: Container(
        color: b,
        // child: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       ...li.map(
        //         (e) => Row(
        //           children: <Widget>[
        //             MyText(e.name, s20),
        //             MyText(' ${e.height}', s20),
        //             MyText(' ${e.date}', s20),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // child: Column(
        //   children: <Widget>[
        //     ...li.map((val) {
        //       return Container(
        //         padding: const EdgeInsets.all(8),
        //         child: Column(
        //           children: <Widget>[
        //             Row(
        //               // crossAxisAlignment: CrossAxisAlignment.center,
        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
        //               children: <Widget>[
        //                 MyText(val.name, s20),
        //                 MyText(' ${val.height}', s20),
        //               ],
        //             ),
        //             MyText(' ${val.date}', s24)
        //           ],
        //         ),
        //       );
        //     })
        //   ],
        // ),
        //ListView.builder, ListView Or add a parent SingleChildScrollView
        child: ListView.builder(
          itemCount: li.length, //Or count if item need to show it.
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Card(
                color: g,
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
                      MyText(' ${li[index].date}', s24)
                    ],
                  ),
                ),
              ),
            );
          },
          //   children: <Widget>[
          //     ...li.map((val) {
          //       //Or container
          //       return Padding(
          //         padding: const EdgeInsets.all(4),
          //         child: Card(
          //           color: g,
          //           shadowColor: w,
          //           elevation: 10,
          //           //Or container
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Column(
          //               children: <Widget>[
          //                 Row(
          //                   // crossAxisAlignment: CrossAxisAlignment.center,
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   children: <Widget>[
          //                     MyText(val.name, s20),
          //                     MyText(' ${val.height}', s20),
          //                   ],
          //                 ),
          //                 MyText(' ${val.date}', s24)
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     })
          //   ],
        ),
        // child: Column(
        //   children: <Widget>[
        //     ...li.map(
        //       (e) => Row(
        //         children: <Widget>[
        //           MyText(e.name, s20),
        //           MyText(' ${e.height}', s20),
        //           MyText(' ${e.date}', s20),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
        // child: Column(
        //   children: [
        //     MyText(x1.name, s20),
        //     MyText(x2.name, s20),
        //   ],
        // ),
      ),
    );
  }
}
