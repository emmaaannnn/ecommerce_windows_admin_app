import 'package:flutter/material.dart';
import 'item.dart'; // ItemCard
import '../../models/item_model.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;
  final VoidCallback? onItemChanged; // <-- new callback

  const ItemList({
    super.key,
    required this.items,
    this.onItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(
            item: items[index],
            onChanged: onItemChanged, // <-- pass down
          );
        },
      ),
    );
  }
}
