import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("\$${price.toStringAsFixed(2)}"),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("\$${price.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
