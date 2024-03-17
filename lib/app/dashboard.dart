import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> posts = [];
  final myController = TextEditingController();
  var str = '';

  @override
  void initState() {
    super.initState();
    // Check if shared preferences have posts or not
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    final bool postsExist = await _checkPostsExist();
    if (postsExist) {
      // Posts exist in SharedPreferences, fetch them
      _loadData();
    } else {
      // Posts don't exist in SharedPreferences, fetch them from the network
      _fetchFromNetwork();
    }
  }

  Future<void> _loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString('posts');
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('posts');
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('posts', json.encode(posts));
  }

  void _updatePost(int index) {
    setState(() {
      posts[index]['status'] = true;
      posts[index]['note'] = str;
      // Set empty to str.
      str = '';
    });
    _saveData();
  }

  Future<void> _showCompletionDialog(int index) async {
    final String? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Complete Title'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter title',
            ),
            onChanged: (value) {
              setState(() {
                str = myController.text;
              });
            },
            controller: myController,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final bool status = posts[index]['status'] ?? false;
          final Color tileColor = status ? Colors.green : Colors.black;
          final String note = posts[index]['note'] ?? '';
          return ListTile(
            title: Text(
              '${posts[index]['title'] ?? 'No title'} $note',
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

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
