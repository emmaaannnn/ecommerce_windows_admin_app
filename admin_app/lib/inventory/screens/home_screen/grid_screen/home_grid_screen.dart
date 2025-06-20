import 'package:flutter/material.dart';
import 'item_grid.dart';
import '../../../data/inventory_data.dart';

class HomeGridScreen extends StatelessWidget {
  const HomeGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Dashboard'),
      ),
      body:
        ItemGrid(items: sampleItems),
    );
  }
}