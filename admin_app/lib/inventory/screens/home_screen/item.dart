import 'package:flutter/material.dart';
import '../../models/item_model.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  int get totalQuantity =>
      item.sizeQuantities.values.fold(0, (prev, qty) => prev + qty);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Fixed height
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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

              // Title, Price, Quantity
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text('Price: \$${item.effectivePrice.toStringAsFixed(2)}'),
                    Text('Qty: $totalQuantity'),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Availability - Center vertically
              Container(
                width: 90, // Fixed width space
                alignment: Alignment.center,
                child: Text(
                  item.isOutOfStock
                      ? 'Out of Stock'
                      : item.isAvailable
                          ? 'Available'
                          : 'Hidden',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: item.isOutOfStock ? Colors.red : Colors.green,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Size/Quantity grid - Aligned right
              Expanded(
                flex: 4,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 8,
                  runSpacing: 4,
                  children: item.sizeQuantities.entries.map((entry) {
                    return Chip(
                      label: Text('${entry.key}: ${entry.value}'),
                      backgroundColor: Colors.grey[100],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
