# DermalVision Shader System Guide

## Overview
DermalVision uses custom GLSL fragment shaders to deliver a premium, "future-dermatology" aesthetic. Shaders are loaded via `FragmentProgram` and applied using the `ShaderCard` widget.

## Performance Considerations
- **Target Frame Rate:** 60fps on iPhone 12 / Pixel 5 equivalent or better.
- **Fallback:** Devices without OpenGL ES 3.0 support or in low-power mode revert to standard Material Design cards.
- **Throttling:** Shaders pause animation when the app is in the background or after 30 seconds of inactivity.

## Shader Library

### 1. Iridescent (Holographic Shimmer)
- **File:** `lib/shared/shaders/iridescent.frag`
- **Effect:** Creates a pearlescent, rainbow-like sheen that shifts with device gyroscope movement.
- **Uniforms:**
  - `uTime`: float (Animation driver)
  - `uResolution`: vec2 (Card size)
  - `uTilt`: vec2 (Gyroscope pitch/roll)

### 2. Liquid Glass (Viscous Surface)
- **File:** `lib/shared/shaders/liquid_glass.frag`
- **Effect:** Simulates a thick, viscous fluid surface with refraction and surface tension ripples on touch.

### 3. Heat Overlay (Medical Visualization)
- **File:** `lib/shared/shaders/heat_overlay.frag`
- **Effect:** Overlays a semi-transparent heatmap on skin images to highlight problem areas.

## Integration & Usage

### Basic Implementation (Dart)
```dart
// Load program once (e.g., in a Provider)
final program = await FragmentProgram.fromAsset('shaders/iridescent.frag');

// Render in a CustomPainter
class ShaderPainter extends CustomPainter {
  final FragmentShader shader;

  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, time); // uTime
    shader.setFloat(1, size.width); // uResolution.x
    shader.setFloat(2, size.height); // uResolution.y

    canvas.drawRect(
      Offset.zero & size,
      Paint()..shader = shader,
    );
  }
}
```

### Troubleshooting & Debugging

| Symptom | Probable Cause | Fix |
| :--- | :--- | :--- |
| **Pink/Purple Screen** | Shader compilation error or invalid uniform types. | Check console logs for GLSL errors. Verify float/vec2 alignment. |
| **Performance Drop** | Too many active shaders or complex math (sin/cos/pow) in loop. | Reduce `MAX_ITER` in GLSL. Use `RepaintBoundary`. |
| **Android Crash** | Old GPU driver (OpenGL ES < 3.0). | Wrap in `try-catch` and fallback to `Container(color: ...)`. |
| **Flickering** | `uTime` precision loss over long sessions. | Reset `uTime` modulo a prime number (e.g., 3600.0). |

## Platform Specifics
- **iOS (Metal):** Shaders are transpiled to MSL. Precision is stricter. Always use `float` literals (e.g., `1.0` not `1`).
- **Android (Skia):** Supports wider range of GLSL but varies by GPU vendor. Test on Adreno (Pixel/Galaxy) and Mali (Exynos/MediaTek).
