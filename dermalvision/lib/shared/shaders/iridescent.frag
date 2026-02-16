#version 460 core
#include <flutter/runtime_effect.glsl>

uniform float uTime;
uniform vec2 uResolution;

out vec4 fragColor;

void main() {
    vec2 uv = FlutterFragCoord().xy / uResolution;
    // Iridescent effect: shifting colors based on time and position
    vec3 col = 0.5 + 0.5 * cos(uTime + uv.xyx + vec3(0, 2, 4));
    // Soft mix with transparency
    fragColor = vec4(col, 0.15);
}
