import 'package:flutter/material.dart';
import '../data/mock_budget.dart';
import '../models/budget_category.dart';
import '../models/cart_item.dart';
import '../models/vendor.dart';

class AppState extends ChangeNotifier {
  final List<CartItem> _cart = [];
  final List<BudgetCategory> _budget = buildMockBudget();

  List<CartItem> get cart => List.unmodifiable(_cart);
  List<BudgetCategory> get budget => List.unmodifiable(_budget);

  double get cartTotal =>
      _cart.fold(0, (sum, item) => sum + item.lineTotal);

  double get totalSpent =>
      _budget.fold(0, (sum, b) => sum + b.actual);

  void addToCart(Vendor vendor) {
    final existing = _cart.where((c) => c.vendor.id == vendor.id);
    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      _cart.add(CartItem(vendor: vendor));
    }
    notifyListeners();
  }

  void removeFromCart(String vendorId) {
    _cart.removeWhere((c) => c.vendor.id == vendorId);
    notifyListeners();
  }

  void confirmBooking(Vendor vendor) {
    final category = _budget.firstWhere(
      (b) => b.name.toLowerCase() == vendor.category.label.toLowerCase(),
      orElse: () => _budget.last,
    );
    category.actual += vendor.price;
    removeFromCart(vendor.id);
    notifyListeners();
  }

  void checkoutAll() {
    for (final item in List<CartItem>.from(_cart)) {
      confirmBooking(item.vendor);
    }
  }
}

class AppStateScope extends InheritedNotifier<AppState> {
  const AppStateScope({super.key, required AppState appState, required super.child})
      : super(notifier: appState);

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'No AppStateScope found in context');
    return scope!.notifier!;
  }
}
