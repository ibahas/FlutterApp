import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/drawer.dart';
import 'package:flutter_application_1/screen2.dart';

class Screen1 extends StatelessWidget {
  static const String routeName = '/screen_1';

  const Screen1({super.key});

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          //We can't pop when go to this page as pushReplaecment and well be black screen
          // Navigator.of(context).pop('TT');
          Navigator.of(context).pop('TT');
        },
        child: const Icon(Icons.delete),
      ),
      // drawerScrimColor: Colors.greenAccent.withOpacity(0.3),
      // drawer: const MyDrawer(),
    );
  }
}
