import 'package:flutter/material.dart';
import '../models/vendor.dart';
import '../state/app_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final cart = appState.cart;

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart'), backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: cart.isEmpty
          ? const Center(child: Text('Your cart is empty.\nBrowse vendors to add bookings.', textAlign: TextAlign.center))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(backgroundColor: item.vendor.swatch, child: const Icon(Icons.image, color: Colors.white, size: 18)),
                    title: Text(item.vendor.name),
                    subtitle: Text('${item.vendor.category.label} · Qty ${item.quantity}'),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('PKR ${item.lineTotal.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        TextButton(
                          onPressed: () => appState.removeFromCart(item.vendor.id),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(40, 20),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text('Remove', style: TextStyle(fontSize: 11, color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    'PKR ${appState.cartTotal.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF3D4FE0)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3D4FE0),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: cart.isEmpty
                      ? null
                      : () {
                          appState.checkoutAll();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Bookings confirmed! Added to your budget tracker.')),
                          );
                        },
                  child: const Text('Proceed To Checkout', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
