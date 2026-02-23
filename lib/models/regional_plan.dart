class RegionalPlan {
  final String name;
  final String dataAmount;
  final int validDays;
  final double price;
  final int supportedCountries;

  const RegionalPlan({
    required this.name,
    required this.dataAmount,
    required this.validDays,
    required this.price,
    required this.supportedCountries,
  });

  String get priceFormatted => 'USD ${price.toStringAsFixed(2)}';
  String get validityFormatted => '$validDays day${validDays > 1 ? 's' : ''}';
}