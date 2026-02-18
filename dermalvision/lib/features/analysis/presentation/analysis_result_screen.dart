import 'package:flutter/material.dart';
import '../domain/analysis_result.dart';
import 'widgets/metric_card.dart';
import 'widgets/skin_heatmap.dart';
import 'widgets/trend_chart.dart';

class AnalysisResultScreen extends StatelessWidget {
  const AnalysisResultScreen({
    super.key,
    required this.result,
    required this.imageUrl,
  });

  final AnalysisResult result;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analysis Result')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heatmap Header
            SizedBox(
              height: 300,
              child: SkinHeatmap(imageUrl: imageUrl),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Summary
                  Text('Summary', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(result.summary, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 24),

                  // Metrics Grid
                  Text('Metrics', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.5,
                    children: [
                      MetricCard(
                        title: 'Overall Health',
                        value: '${result.compositeScores.overallHealth.toInt()}/100',
                        trend: 2.5, // Mock trend
                      ),
                      MetricCard(
                        title: 'Skin Age',
                        value: '${result.compositeScores.skinAge ?? "N/A"}',
                      ),
                      // Add condition results
                      ...result.results.entries.map((e) => MetricCard(
                        title: e.key,
                        value: (e.value.severity * 100).toStringAsFixed(0),
                        status: e.value.detected ? 'Detected' : 'Clear',
                      )),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Trends
                  Text('Trends', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  const SizedBox(height: 150, child: TrendChart(dataPoints: [60, 65, 62, 70, 75])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
