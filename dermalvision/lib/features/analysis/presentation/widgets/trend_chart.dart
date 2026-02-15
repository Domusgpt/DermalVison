import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TrendChart extends StatelessWidget {
  const TrendChart({super.key, required this.dataPoints});

  final List<double> dataPoints;

  @override
  Widget build(BuildContext context) {
    if (dataPoints.isEmpty) return const SizedBox.shrink();

    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: dataPoints.asMap().entries.map((e) {
                  return FlSpot(e.key.toDouble(), e.value);
                }).toList(),
                isCurved: true,
                color: Theme.of(context).primaryColor,
                barWidth: 3,
                dotData: const FlDotData(show: true),
                belowBarData: BarAreaData(show: true, color: Theme.of(context).primaryColor.withOpacity(0.1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
