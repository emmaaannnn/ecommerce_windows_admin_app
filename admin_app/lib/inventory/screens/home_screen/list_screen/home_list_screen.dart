import 'package:flutter/material.dart';

class HomeListScreen extends StatelessWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Dashboard'),
      ),
      body: Center(
        child: Text(
          'Hello World THIS IS FOR LIST',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}