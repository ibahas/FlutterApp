import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen2.dart';

class screen1 extends StatelessWidget {
  final String str1;

  const screen1(this.str1, {super.key});

  void selectScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return const screen2('info 2');
    }));
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
            Text(
              str1,
              style: const TextStyle(color: Colors.amber),
            )
          ],
        ),
      ),
    );
  }
}
