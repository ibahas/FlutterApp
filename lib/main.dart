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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main screen'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: ('Screen1'),
              ),
              Tab(
                icon: Icon(Icons.star),
                text: ('Screen2'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Screen1(),
            // Screen2(),
            Scaffold(
              appBar: AppBar(
                title: const Text('Part 1'),
              ),
              body: const Center(child: Text('Text 1')),
            ),
            const Scaffold(
              body: Center(child: Text('Text 2')),
            ),
          ],
        ),
        drawerScrimColor: Colors.pinkAccent.withOpacity(0.3),
        drawer: Drawer(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: const Text(
                  'Screen 1',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => selectScreen(context, Screen1.routeName),
                subtitle: const Text('Screen 1 info'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: const Text(
                  'Screen 2',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => selectScreen(context, Screen2.routeName),
                subtitle: const Text('Screen 2 info'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
