import 'package:flutter/material.dart';
import '../models/vendor.dart';
import '../state/app_state.dart';

class VendorProfileScreen extends StatelessWidget {
  final Vendor vendor;

  const VendorProfileScreen({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(vendor.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: vendor.swatch, child: const Icon(Icons.store, color: Colors.white)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vendor.category.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Row(
                      children: List.generate(
                        5,
                        (i) => Icon(
                          i < vendor.rating.round() ? Icons.star : Icons.star_border,
                          size: 16,
                          color: Colors.amber[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(vendor.description, style: const TextStyle(color: Colors.black87, height: 1.4)),
          const SizedBox(height: 20),
          Text('PKR ${vendor.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3D4FE0))),
          const SizedBox(height: 20),
          const Text('Portfolio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
            ),
            itemCount: vendor.portfolioLabels.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: vendor.swatch.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, color: vendor.swatch),
                    const SizedBox(height: 6),
                    Text(vendor.portfolioLabels[index], style: const TextStyle(fontSize: 12)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3D4FE0),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                appState.addToCart(vendor);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${vendor.name} added to cart')),
                );
              },
              child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
