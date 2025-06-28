import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onAddPressed;
  final VoidCallback onSavePressed;
  final bool showSaveButton;

  const HomeHeader({
    super.key,
    required this.onAddPressed,
    required this.onSavePressed,
    required this.showSaveButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Add New Product
          ElevatedButton.icon(
            onPressed: onAddPressed,
            icon: const Icon(Icons.add),
            label: const Text("New Product"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),

          const Spacer(),

          // Save Changes (only if showSaveButton is true)
          if (showSaveButton)
            ElevatedButton(
              onPressed: onSavePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text("Save Changes"),
            ),
        ],
      ),
    );
  }
}
