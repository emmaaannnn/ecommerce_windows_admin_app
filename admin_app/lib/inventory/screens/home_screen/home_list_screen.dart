import 'package:flutter/material.dart';
import 'item_list.dart';
import 'package:admin_app/inventory/data/inventory_data.dart';

class HomeListScreen extends StatelessWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Dashboard'),
      ),
      body: ItemList(items: sampleItems),
    );
  }
}