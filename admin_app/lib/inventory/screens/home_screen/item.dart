import 'package:flutter/material.dart';
import '../../models/item_model.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  int get totalQuantity =>
      item.sizeQuantities.values.fold(0, (prev, qty) => prev + qty);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Information
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item.imageUrls.first),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                ),

                const SizedBox(width: 12),

                // Title of Item
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(width: 12),
                
                // Availability, price and quantity
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.isOutOfStock
                            ? 'Out of Stock'
                            : item.isAvailable
                                ? 'Available'
                                : 'Hidden',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: item.isOutOfStock ? Colors.red : Colors.green,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text('Price: \$${item.effectivePrice.toStringAsFixed(2)}'),
                      Text('Qty: $totalQuantity'),
                    ],
                  ),
                ),

                const SizedBox(width: 12),
                
                // Size/Quantity grid
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: item.sizeQuantities.entries.map((entry) {
                    return Chip(
                      label: Text('${entry.key}: ${entry.value}'),
                      backgroundColor: Colors.grey[100],
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}