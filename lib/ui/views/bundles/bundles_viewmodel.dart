import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../models/bundle_model.dart';
import '../../../models/cart_item.dart';
import '../../../models/regional_plan.dart';
import '../../../services/bundle_service.dart';

enum FilterType { all, standard, unlimited }

class BundlesViewModel extends BaseViewModel {
  final _bundleService = locator<BundleService>();

  FilterType _selectedFilter = FilterType.all;
  FilterType get selectedFilter => _selectedFilter;

  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  List<BundleModel> get allBundles => _bundleService.getBundles();

  List<RegionalPlan> get regionalPlans => _bundleService.getRegionalPlans();

  List<BundleModel> get filteredBundles {
    switch (_selectedFilter) {
      case FilterType.standard:
        return allBundles.where((b) => b.type == BundleType.standard).toList();
      case FilterType.unlimited:
        return allBundles.where((b) => b.type == BundleType.unlimited).toList();
      case FilterType.all:
        return allBundles;
    }
  }

  bool get hasCartItems => _cartItems.isNotEmpty;

  double get cartTotal => _cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  String get cartTotalFormatted => 'USD ${cartTotal.toStringAsFixed(2)}';

  bool isInCart(String bundleId) => _cartItems.any((i) => i.bundle.id == bundleId);

  int getQuantity(String bundleId) {
    final item = _cartItems.where((i) => i.bundle.id == bundleId).firstOrNull;
    return item?.quantity ?? 0;
  }

  void setFilter(FilterType filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void addToCart(BundleModel bundle) {
    final index = _cartItems.indexWhere((i) => i.bundle.id == bundle.id);
    if (index >= 0) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(bundle: bundle));
    }
    notifyListeners();
  }

  void increment(String bundleId) {
    final index = _cartItems.indexWhere((i) => i.bundle.id == bundleId);
    if (index >= 0) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decrement(String bundleId) {
    final index = _cartItems.indexWhere((i) => i.bundle.id == bundleId);
    if (index >= 0) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeFromCart(String bundleId) {
    _cartItems.removeWhere((i) => i.bundle.id == bundleId);
    notifyListeners();
  }
}