import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  static const String routeName = '/screen_1';

  void selectScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      Screen2.routeName,
      arguments: {
        'id': 20,
        'title': 'Info screen2',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child:
                  const Text('Screen 2', style: TextStyle(color: Colors.black)),
              onTap: () => {
                selectScreen(context),
              },
            ),
          ],
        ),
      ),
    );
  }
}