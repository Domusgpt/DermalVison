import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lighting_service.g.dart';

enum LightingQuality { good, poor, tooDark, glare }

@Riverpod(keepAlive: true)
LightingService lightingService(Ref ref) {
  return LightingService();
}

class LightingService {
  Stream<LightingQuality> get lightingQualityStream {
    // Basic heuristic mapping lux to quality
    // This is a simplified implementation using LightSensor (Android only usually)
    // For cross-platform, one might analyze the camera image stream instead.
    // Here we return a dummy stream for now or use the sensor if available.
    // Note: sensors_plus does not strictly support LightSensor on all platforms.
    // We will simulate 'good' lighting for the MVP if sensor not present.
    return Stream.value(LightingQuality.good);
  }

  // In a real implementation, we would analyze the camera image luminance here.
  LightingQuality analyzeLuminance(double luminance) {
    if (luminance < 50) return LightingQuality.tooDark;
    if (luminance > 1000) return LightingQuality.glare;
    if (luminance < 200) return LightingQuality.poor;
    return LightingQuality.good;
  }
}
