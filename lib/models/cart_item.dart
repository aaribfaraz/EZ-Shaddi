import 'vendor.dart';

class CartItem {
  final Vendor vendor;
  int quantity;

  CartItem({required this.vendor, this.quantity = 1});

  double get lineTotal => vendor.price * quantity;
}
