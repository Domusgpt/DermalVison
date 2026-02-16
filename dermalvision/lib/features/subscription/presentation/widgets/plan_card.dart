import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({super.key, required this.package, required this.onTap});

  final Package package;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(package.storeProduct.title),
        subtitle: Text(package.storeProduct.description),
        trailing: Text(package.storeProduct.priceString),
        onTap: onTap,
      ),
    );
  }
}
