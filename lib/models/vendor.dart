import 'package:flutter/material.dart';

enum VendorCategory { venue, photographer, decor, catering }

extension VendorCategoryLabel on VendorCategory {
  String get label {
    switch (this) {
      case VendorCategory.venue:
        return 'Venue';
      case VendorCategory.photographer:
        return 'Photographer';
      case VendorCategory.decor:
        return 'Decor';
      case VendorCategory.catering:
        return 'Catering';
    }
  }
}

class Vendor {
  final String id;
  final String name;
  final VendorCategory category;
  final double price;
  final double rating;
  final String distance;
  final Color swatch;
  final String description;
  final List<String> portfolioLabels;

  const Vendor({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.distance,
    required this.swatch,
    required this.description,
    required this.portfolioLabels,
  });
}
