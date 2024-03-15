import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> posts = [];

  var MyController = '';

  @override
  void initState() {
    super.initState();
    //Check if shared prefernces have posts or not ?
    _fetchPosts();
  }

  void _fetchPosts() async {
    bool postsExist = await _checkPostsExist();
    if (postsExist) {
      // Posts exist in SharedPreferences, fetch them
      _loadData();
    } else {
      // Posts don't exist in SharedPreferences, fetch them from the network
      _fetchFromNetwork();
    }
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString('posts');
    if (jsonData != null) {
      setState(() {
        posts = List<Map<String, dynamic>>.from(json.decode(jsonData));
      });
    } else {
      throw Exception('No posts found in SharedPreferences');
    }
  }

  Future<void> _fetchFromNetwork() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final List<dynamic> fetchedPosts = jsonDecode(res.body);
      setState(() {
        posts = List<Map<String, dynamic>>.from(fetchedPosts);
      });
      _saveData(); // Save fetched posts in SharedPreferences
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<bool> _checkPostsExist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('posts');
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('posts', json.encode(posts));
  }

  void _updatePost(int index) {
    setState(() {
      // posts[index]['title'] = title;
      posts[index]['status'] = true;
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          bool status = posts[index]['status'] ?? false;
          Color tileColor = status ? Colors.green : Colors.black;
          return ListTile(
            title: Text(
              posts[index]['title'] ?? 'No title',
              style: TextStyle(color: tileColor),
            ),
            subtitle: Text(
              posts[index]['body'] ?? 'No body',
              style: const TextStyle(color: Colors.black),
            ),
            onTap: () {
              _showCompletionDialog(index);
            },
          );
        },
      ),
    );
  }

  Future<void> _showCompletionDialog(int index) async {
    String? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Complete Title'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter title',
            ),
            onChanged: (value) {
              // Handle text input change
            },
            controller: MyController,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('Completed');
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (result == 'Completed') {
      _updatePost(index);
    }
  }
}
