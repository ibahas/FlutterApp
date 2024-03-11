import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';
import 'package:flutter_application_1/screen1.dart';

class Screen2 extends StatelessWidget {
  static const String routeName = '/screen_2';

  const Screen2({super.key});

  void selectScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      Screen1.routeName,
      arguments: {
        'id': 11,
        'title': 'Info screen1',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child:
                  const Text('Screen 1', style: TextStyle(color: Colors.black)),
              onTap: () => {
                selectScreen(context),
              },
            ),
          ],
        ),
      ),
      drawerScrimColor: Colors.blueAccent.withOpacity(0.3),
      drawer: const MyDrawer(),
    );
  }
}
