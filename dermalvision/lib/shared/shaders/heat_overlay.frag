#version 460 core
#include <flutter/runtime_effect.glsl>

uniform float uTime;
uniform vec2 uResolution;

out vec4 fragColor;

void main() {
    vec2 uv = FlutterFragCoord().xy / uResolution;
    // Heatmap gradient
    vec3 color = mix(vec3(0.0, 0.0, 1.0), vec3(1.0, 0.0, 0.0), uv.y);
    float alpha = 0.3 * (1.0 - distance(uv, vec2(0.5)));
    fragColor = vec4(color, alpha);
}
