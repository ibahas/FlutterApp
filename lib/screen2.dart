import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);
  

  static const String routeName = '/screen_2';
  

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
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    var id = routeArg['id'];
    var title = routeArg['title'];

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
            Text(
              '$id',
              // 's${routeArg["id"]}',
              style: const TextStyle(color: Colors.amber),
            ),
            Text(
              '$title',
              // routeArg['title'],
              style: const TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
