import 'package:flutter/material.dart';
import 'item_list.dart';
import 'package:admin_app/inventory/data/inventory_data.dart';
import 'home_header.dart';

class HomeListScreen extends StatefulWidget {
  const HomeListScreen({super.key});

  @override
  State<HomeListScreen> createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  bool hasUnsavedChanges = false;

  void handleAddProduct() {
    // TODO: Show modal or navigate to product creation screen
    print("Add new product");
  }

  void handleSaveChanges() {
    // TODO: Trigger save logic
    print("Changes saved");
    setState(() {
      hasUnsavedChanges = false;
    });
  }

  // TODO: In the future, you can pass a callback to ItemList that triggers this:
  void onItemChanged() {
    if (!hasUnsavedChanges) {
      setState(() {
        hasUnsavedChanges = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Dashboard'),
      ),
      body: Column(
        children: [
          HomeHeader(
            onAddPressed: handleAddProduct,
            onSavePressed: handleSaveChanges,
            showSaveButton: hasUnsavedChanges,
          ),
          Expanded(
            child: ItemList(
              items: sampleItems,
              // onItemChanged: onItemChanged, // Optional future integration
            ),
          ),
        ],
      ),
    );
  }
}
