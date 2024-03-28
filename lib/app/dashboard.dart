import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/AppLocalizations.dart';
import 'package:flutter_application_1/components/api_service.dart';
import 'package:flutter_application_1/config/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> audits = [];
  final myController = TextEditingController();
  var str = '';

  @override
  void initState() {
    super.initState();
    // Check if shared preferences have audits or not
    _fetchAudits();
  }

  Future<bool> _checkWifiConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi;
  }

  Future<void> _fetchAudits() async {
    bool isWifiConnected = await _checkWifiConnection();
    if (isWifiConnected) {
      final bool auditsExist = await _checkAuditsExist();
      if (!auditsExist) {
        // Audits exist in SharedPreferences, fetch them
        _loadData();
      } else {
        // Audits don't exist in SharedPreferences, fetch them from the network
        _fetchFromNetwork();
      }
    } else {
      // Device is not connected to Wi-Fi, fetch audits from the network
      _fetchFromNetwork();
    }
  }

  Future<void> _loadData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? jsonData = prefs.getString('audits');
      if (jsonData != null) {
        setState(() {
          audits = List<Map<String, dynamic>>.from(jsonDecode(jsonData));
        });
      } else {
        // Audits not found in SharedPreferences
        print('No audits found in SharedPreferences');
        // Show user-friendly message or handle the case
      }
    } catch (e) {
      // Handle SharedPreferences read error
      print('Failed to load audits from SharedPreferences: $e');
      // Show user-friendly message or handle the case
    }
  }

  Future<void> _fetchFromNetwork() async {
    try {
      final res = await ApiService.get(AppConfig.auditsUrl);
      if (res.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final List<dynamic> fetchedAudits = responseData['data'];
        setState(() {
          audits = List<Map<String, dynamic>>.from(fetchedAudits);
        });
        await _saveData();
      } else {
        // Handle HTTP error
        print('Failed to load audits: ${res.statusCode}');
        // Show user-friendly message or retry logic
      }
    } catch (e) {
      // Handle network or JSON decoding error
      print('Failed to load audits: $e');
      // Show user-friendly message or retry logic
    }
  }

  Future<bool> _checkAuditsExist() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('audits');
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('audits', json.encode(audits));
  }

  void _updatePost(int index) {
    setState(() {
      audits[index]['status'] = true;
      audits[index]['note'] = str;
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
      body: audits.isEmpty
          ? Center(
              child: Text(
                AppLocalizations.of(context, 'No data !') ?? 'No data !',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          : ListWheelScrollView(
              diameterRatio: 2,
              itemExtent: 100,
              children: audits.map((audit) {
                final bool status = audit['status'] ?? false;
                final Color tileColor = status ? Colors.green : Colors.black;
                final String note = audit['note'] ?? '';
                return ListTile(
                  title: Text(
                    '${audit['title'] ?? 'No title'} $note',
                    style: TextStyle(color: tileColor),
                  ),
                  subtitle: Text(
                    audit['body'] ?? 'No body',
                    style: const TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    _showCompletionDialog(audits.indexOf(
                        audit)); // Pass the index of the selected audit
                  },
                );
              }).toList(),
            ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
