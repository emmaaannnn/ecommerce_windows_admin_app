enum InventoryChangeReason {
  restock,
  returnItem,
  faulty,
  manualAdjustment,
  transfer,
}

class InventoryHistoryRecord {
  final String itemId; // Reference to the affected item
  final DateTime timestamp;
  final String size; // e.g., 'M'
  final int quantityChanged; // +10 or -2
  final InventoryChangeReason reason;
  final String? note; // optional human-readable message
  final String changedBy; // user/admin identifier

  InventoryHistoryRecord({
    required this.itemId,
    required this.timestamp,
    required this.size,
    required this.quantityChanged,
    required this.reason,
    this.note,
    required this.changedBy,
  });
}