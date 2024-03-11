import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void selectScreen(BuildContext context, screenClass) {
    if (screenClass == '/screen_1') {
      Navigator.of(context).pushNamed(
        screenClass,
        arguments: {
          'id': 10,
          'title': 'info screen $screenClass',
        },
      ).then((value) => null);
    } else {
      Navigator.of(context).pushReplacementNamed(
        screenClass,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: const Text(
              'Main screen',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () => selectScreen(context, '/'),
            subtitle: const Text('Main screen'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
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
    );
  }
}
