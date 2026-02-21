import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../core/services/camera_service.dart';
import '../../../core/services/lighting_service.dart';
import '../../monitoring/domain/monitoring_session.dart';
import '../../monitoring/domain/monitoring_provider.dart';
import '../../auth/domain/auth_provider.dart';
import 'widgets/guide_overlay.dart';
import 'widgets/ghost_image_overlay.dart';
import 'widgets/lighting_indicator.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key, required this.zoneId});
  final String zoneId;

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  final LightingQuality _lightingQuality = LightingQuality.good;

  @override
  Widget build(BuildContext context) {
    final cameraControllerAsync = ref.watch(cameraServiceProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          cameraControllerAsync.when(
            data: (controller) {
              if (controller == null || !controller.value.isInitialized) {
                return const Center(
                  child: Text('Camera not initialized', style: TextStyle(color: Colors.white)),
                );
              }
              return CameraPreview(controller);
            },
            error: (e, s) => Center(child: Text('Camera Error: $e', style: const TextStyle(color: Colors.white))),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          const GhostImageOverlay(),
          const GuideOverlay(readiness: 0.0),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LightingIndicator(quality: _lightingQuality),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.switch_camera, color: Colors.white),
                      onPressed: () {
                        ref.read(cameraServiceProvider.notifier).switchCamera();
                      },
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () async {
                        final file = await ref.read(cameraServiceProvider.notifier).takePicture();
                        if (!context.mounted || file == null) return;

                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Save Photo?'),
                            content: SizedBox(
                              height: 200,
                              child: Image.file(File(file.path), fit: BoxFit.cover),
                            ),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Retake')),
                              TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Save')),
                            ],
                          ),
                        );

                        if (!context.mounted || confirmed != true) return;

                        final user = ref.read(authStateProvider).value;
                        if (user == null) return;

                        final session = MonitoringSession(
                          id: const Uuid().v4(),
                          zoneId: widget.zoneId,
                          capturedAt: DateTime.now(),
                          photoUrls: const PhotoUrls(original: ''),
                          captureMetadata: const CaptureMetadata(),
                        );

                        await ref.read(monitoringRepositoryProvider).saveSession(
                              user.uid,
                              session,
                              File(file.path),
                            );

                        if (!context.mounted) return;
                        context.go('/session/${session.id}/waiting');
                      },
                      child: const Icon(Icons.camera_alt, color: Colors.black),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
