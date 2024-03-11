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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Widget>> _pages = [
    {
      'page': const Scaffold(
        body: Center(
          child: Text('Text 1'),
        ),
      ),
      'title': const Text('Part 1')
    },
    {
      'page': const Scaffold(
        body: Center(
          child: Text('Text 2'),
        ),
      ),
      'title': const Text('Part 2')
    },
  ];

  int _selectedPageIndex = 0;

  void _x1(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: _pages[_selectedPageIndex]['title'],
        ),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          type: BottomNavigationBarType.shifting,
          onTap: _x1,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.pinkAccent,
              icon: Icon(Icons.category),
              label: 'Part 1',
              tooltip: 'Part 1',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.pinkAccent,
              icon: Icon(Icons.star),
              label: 'Part 2',
              tooltip: 'Part 2',
            ),
          ],
        ),
        drawerScrimColor: Colors.pinkAccent.withOpacity(0.3),
        drawer: const MyDrawer(),
      ),
    );
  }
}
