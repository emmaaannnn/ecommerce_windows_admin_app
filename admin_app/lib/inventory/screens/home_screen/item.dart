import 'package:flutter/material.dart';
import '../../models/item_model.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final VoidCallback? onChanged;

  const ItemCard({
    super.key,
    required this.item,
    this.onChanged,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late String availabilityStatus;

  @override
  void initState() {
    super.initState();
    // Set initial state
    availabilityStatus = widget.item.isAvailable ? 'Available' : 'Hidden';
  }

  void handleAvailabilityChange(String? newValue) {
    if (newValue == null || newValue == availabilityStatus) return;

    setState(() {
      availabilityStatus = newValue;
      // Later you can also update the item’s internal state if needed
    });

    widget.onChanged?.call();
  }

  int get totalQuantity =>
      widget.item.sizeQuantities.values.fold(0, (prev, qty) => prev + qty);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
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
                    image: NetworkImage(widget.item.imageUrls.first),
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
                      widget.item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text('Price: \$${widget.item.effectivePrice.toStringAsFixed(2)}'),
                    Text('Qty: $totalQuantity'),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Availability Dropdown
              Container(
                width: 100,
                alignment: Alignment.center,
                child: widget.item.isOutOfStock
                    ? Text(
                        'Out of Stock',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      )
                    : DropdownButton<String>(
                        value: availabilityStatus,
                        items: const [
                          DropdownMenuItem(
                            value: 'Available',
                            child: Text(
                              'Available',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Hidden',
                            child: Text(
                              'Hidden',
                              style: TextStyle(color: Colors.blue),
                              ),
                          ),
                        ],
                        onChanged: handleAvailabilityChange,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
              ),

              const SizedBox(width: 12),

              // Size/Quantity Grid
              Expanded(
                flex: 4,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 8,
                  runSpacing: 4,
                  children: widget.item.sizeQuantities.entries.map((entry) {
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
