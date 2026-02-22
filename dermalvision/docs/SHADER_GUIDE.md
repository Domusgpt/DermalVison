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
- **Usage:** Used on Premium/Pro plan cards and high-confidence analysis results.

### 2. Liquid Glass (Viscous Surface)
- **File:** `lib/shared/shaders/liquid_glass.frag`
- **Effect:** Simulates a thick, viscous fluid surface with refraction and surface tension ripples on touch.
- **Uniforms:**
  - `uTime`: float
  - `uTouch`: vec2 (Touch position, normalized)
  - `uScrollOffset`: float (Vertical scroll position)
- **Usage:** Main dashboard cards, "Start Scan" buttons.

### 3. Heat Overlay (Medical Visualization)
- **File:** `lib/shared/shaders/heat_overlay.frag`
- **Effect:** Overlays a semi-transparent heatmap on skin images to highlight problem areas (red/yellow for high severity).
- **Uniforms:**
  - `uTexture`: sampler2D (Original image)
  - `uHeatMap`: sampler2D (Generated low-res heatmap data)
  - `uIntensity`: float (Opacity control)
- **Usage:** Analysis Result screens.

## Implementation Details
The `ShaderCard` widget handles:
- Loading the `FragmentProgram`.
- Managing the animation `Ticker`.
- Passing touch events to the shader as uniforms.
- Optimizing repaints (using `RepaintBoundary`).

```dart
ShaderCard(
  shaderAsset: 'shaders/iridescent.frag',
  child: AnalysisCardContent(...),
)
```
