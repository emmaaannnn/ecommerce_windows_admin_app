enum ClothingType {
  tshirt,
  pants,
  shorts,
  jacket,
  hoodie,
  accessories,
}

class Item {
  final String id;
  final String name;
  final String description;
  final Map<String, int> sizeQuantities; // e.g., {'S': 10, 'M': 5, 'L': 0}
  final double price;
  final double? salePrice;
  final double? salePercent; // e.g., 0.2 for 20% off
  final bool isOnSale;
  final bool isOutOfStock;
  final bool isAvailable; // for hiding/unhiding item
  final bool isArchived;
  final List<String> imageUrls;
  final DateTime lastUpdated;
  final String collection; // e.g., "Winter 2025", "Streetwear"
  final ClothingType clothingType;


  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.sizeQuantities,
    required this.price,
    this.salePrice,
    this.salePercent,
    this.isOnSale = false,
    this.isOutOfStock = false,
    this.isAvailable = true,
    this.isArchived = false,
    required this.imageUrls,
    required this.lastUpdated,
    required this.collection,
    required this.clothingType,
  });

  double get effectivePrice {
    if (isOnSale) {
      if (salePrice != null) return salePrice!;
      if (salePercent != null) return price * (1 - salePercent!);
    }
    return price;
  }
}
