import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        
      ),
    );
  }
}