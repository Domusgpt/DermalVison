import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_service.g.dart';

@riverpod
class CameraService extends _$CameraService {
  List<CameraDescription> _cameras = const [];
  int _currentCameraIndex = 0;

  @override
  Future<CameraController?> build() async {
    _cameras = await availableCameras();
    if (_cameras.isEmpty) {
      return null;
    }

    final controller = CameraController(
      _cameras[_currentCameraIndex],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await controller.initialize();

    ref.onDispose(() async {
      await controller.dispose();
    });

    return controller;
  }

  Future<void> switchCamera() async {
    final current = state.value;
    if (_cameras.length < 2 || current == null) {
      return;
    }

    _currentCameraIndex = (_currentCameraIndex + 1) % _cameras.length;

    state = const AsyncLoading();
    await current.dispose();

    try {
      final next = CameraController(
        _cameras[_currentCameraIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await next.initialize();
      state = AsyncData(next);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<XFile?> takePicture() async {
    final controller = state.value;
    if (controller == null || !controller.value.isInitialized) {
      return null;
    }
    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      return await controller.takePicture();
    } catch (_) {
      return null;
    }
  }
}
