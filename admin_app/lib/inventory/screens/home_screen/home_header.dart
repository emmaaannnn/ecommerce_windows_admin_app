import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onAddPressed;
  final VoidCallback onSavePressed;
  final VoidCallback onDiscardPressed;
  final bool showSaveButton;

  const HomeHeader({
    super.key,
    required this.onAddPressed,
    required this.onSavePressed,
    required this.onDiscardPressed,
    required this.showSaveButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // When changes are made: show Discard button
          if (showSaveButton)
            ElevatedButton.icon(
              onPressed: onDiscardPressed,
              icon: const Icon(Icons.undo),
              label: const Text("Discard Changes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                foregroundColor: Colors.white,
              ),
            )
          else
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

          // Save Changes button (only when changes exist)
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
