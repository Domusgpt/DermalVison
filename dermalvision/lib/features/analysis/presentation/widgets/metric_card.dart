import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    this.status,
    this.trend,
  });

  final String title;
  final String value;
  final String? status;
  final double? trend;

  @override
  Widget build(BuildContext context) {
    Color trendColor = Colors.grey;
    if (trend != null) {
      trendColor = trend! > 0 ? Colors.green : Colors.red;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: Theme.of(context).textTheme.headlineSmall),
                if (trend != null)
                  Row(
                    children: [
                      Icon(
                        trend! > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                        color: trendColor,
                        size: 16,
                      ),
                      Text(
                        '${trend!.abs().toStringAsFixed(1)}%',
                        style: TextStyle(color: trendColor),
                      ),
                    ],
                  ),
              ],
            ),
            if (status != null) ...[
              const SizedBox(height: 8),
              Text(status!, style: TextStyle(color: Colors.grey[400])),
            ],
          ],
        ),
      ),
    );
  }
}
