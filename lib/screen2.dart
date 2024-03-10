import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';

class screen2 extends StatelessWidget {
  const screen2({super.key});

  void selectScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return const screen1();
    }));
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
    );
  }
}
