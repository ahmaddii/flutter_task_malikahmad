import 'bundle_model.dart';

class CartItem {
  final BundleModel bundle;
  int quantity;

  CartItem({
    required this.bundle,
    this.quantity = 1,
  });

  double get totalPrice => bundle.price * quantity;

  String get totalPriceFormatted => 'USD ${totalPrice.toStringAsFixed(2)}';

  String get subtitle => '${bundle.dataAmount} / ${bundle.validDays} Days';
}