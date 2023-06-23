import 'package:flutter/material.dart';

class ShowSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Already logged in.'),
      duration: Duration(seconds: 20),
      backgroundColor: Colors.purpleAccent,
    )),) 
  }
}
