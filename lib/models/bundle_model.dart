enum BundleType { standard, unlimited }

class BundleModel {
  final String id;
  final String dataAmount;
  final int validDays;
  final double price;
  final bool isUnlimited;
  final BundleType type;

  const BundleModel({
    required this.id,
    required this.dataAmount,
    required this.validDays,
    required this.price,
    this.isUnlimited = false,
    required this.type,
  });

  String get priceFormatted => 'USD ${price.toStringAsFixed(2)}';
  String get validityFormatted => '$validDays days';
}