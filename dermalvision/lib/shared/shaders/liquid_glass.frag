#version 460 core
#include <flutter/runtime_effect.glsl>

uniform float uTime;
uniform vec2 uResolution;

out vec4 fragColor;

void main() {
    vec2 uv = FlutterFragCoord().xy / uResolution;
    float dist = length(uv - 0.5);
    // Liquid ripple
    float ripple = sin(dist * 20.0 - uTime * 2.0);
    // Highlight
    float highlight = smoothstep(0.4, 0.6, ripple);

    fragColor = vec4(vec3(1.0), highlight * 0.1);
}
