import 'package:flutter/material.dart';
import 'item_card.dart'; // make sure this path matches your project structure
import '../../../models/item_model.dart';

class ItemGrid extends StatelessWidget {
  final List<Item> items;

  const ItemGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 columns
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1 / 1, // adjust depending on card height
        ),
        itemBuilder: (context, index) {
          return ItemCard(item: items[index]);
        },
      ),
    );
  }
}