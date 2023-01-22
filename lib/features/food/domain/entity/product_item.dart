import 'package:flutter/material.dart';

class ProductItem {
  ProductItem({
    required this.imageUrl,
    required this.price,
    this.title,
    this.description,
  });

  final String imageUrl;
  final String? title;
  final String? description;
  final double price;
}
