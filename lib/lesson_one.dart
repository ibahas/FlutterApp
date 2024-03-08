import 'package:flutter/material.dart';

class LessonOne extends StatelessWidget {
  const LessonOne({super.key});

  buttonOnPressed(msg) {
    print('Button clicked $msg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add'),
        onPressed: () => buttonOnPressed('+'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide(
              color: Colors.red,
              width: 6,
              style: BorderStyle.solid,
            )),
        splashColor: Colors.green,
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        shadowColor: Colors.tealAccent,
        leading: const Icon(
          Icons.menu,
          color: Colors.red,
        ),
        title: const Text('Title'),
        actions: const [
          Icon(Icons.menu),
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text('Text'),
                  Text('Text'),
                  Text('Text'),
                ],
              ),
              const Row(
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text('A'),
                  ),
                  OutlinedButton(
                    onPressed: null,
                    child: Text('B'),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('C'),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.menu_book),
                    label: const Text('A'),
                  ),
                  OutlinedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.menu_book),
                    label: const Text('B'),
                    autofocus: true,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(5, 0, 10, 30)),
                      // elevation: MaterialStateProperty.all(0)
                    ),
                    onPressed: null,
                    icon: const Icon(
                      Icons.menu_book,
                      // color: Colors.blue,
                    ),
                    label: const Text('C'),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        print('CC');
                      },
                      icon: const Icon(Icons.media_bluetooth_off)),
                  IconButton(
                      onPressed: () => print('CC !'),
                      icon: const Icon(Icons.media_bluetooth_off)),
                  IconButton(
                      onPressed: () => buttonOnPressed('Icon Button ...'),
                      icon: const Icon(
                        Icons.media_bluetooth_off,
                      )),
                  FloatingActionButton.extended(
                    label: const Text('Add'),
                    onPressed: () => buttonOnPressed('+'),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: Colors.red,
                          width: 6,
                          style: BorderStyle.solid,
                        )),
                    splashColor: Colors.green,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
