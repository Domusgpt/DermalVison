#version 460 core
#include <flutter/runtime_effect.glsl>

uniform float uTime;
uniform vec2 uResolution;
uniform vec2 uTouch;
uniform float uScrollOffset;
uniform float uDepth;
uniform float uInteraction;
uniform sampler2D uTexture;

out vec4 fragColor;

void main() {
    vec2 uv = FlutterFragCoord().xy / uResolution;
    vec4 color = texture(uTexture, uv);
    fragColor = color;
}
