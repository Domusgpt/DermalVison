import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen(
      {super.key, required this.beforeUrl, required this.afterUrl});

  final String beforeUrl;
  final String afterUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comparison')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                              imageUrl: beforeUrl, fit: BoxFit.cover)),
                      const Padding(
                          padding: EdgeInsets.all(8), child: Text('Before')),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1, color: Colors.white),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                              imageUrl: afterUrl, fit: BoxFit.cover)),
                      const Padding(
                          padding: EdgeInsets.all(8), child: Text('After')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
