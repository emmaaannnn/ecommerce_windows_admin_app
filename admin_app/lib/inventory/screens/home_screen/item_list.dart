import 'package:flutter/material.dart';
import 'item.dart'; // make sure this path matches your project structure
import '../../models/item_model.dart'; // your Item model

class ItemList extends StatelessWidget {
  final List<Item> items;

  const ItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(item: items[index]);
        },
      ),
    );
  }
}