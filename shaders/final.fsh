#version 120

// Iris reads these values and their allowed lists as shader-pack options.
#define FILTER_STRENGTH 1.00 // [0.00 0.10 0.20 0.30 0.40 0.50 0.60 0.70 0.80 0.90 1.00]
#define TEMPERATURE 4500 // [2700 3000 3250 3500 3750 4000 4250 4500 4750 5000 5250 5500 5750 6000 6250 6500 6750 7000 7250 7500]
#define CONTRAST 0.90 // [0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40]
#define BLACK_LEVEL 0.025 // [0.000 0.005 0.010 0.015 0.020 0.025 0.030 0.040 0.050 0.060 0.080 0.100 0.120]
#define WHITE_LEVEL 0.90 // [0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00]
#define HIGHLIGHTS 0.20 // [0.00 0.10 0.20 0.30 0.40 0.50 0.60 0.70 0.80 0.90 1.00]
#define SATURATION 0.85 // [0.00 0.10 0.20 0.30 0.40 0.50 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20]

uniform sampler2D colortex0;
varying vec2 texcoord;

// Display-referred RGB gains, artist-tuned to approximate a warm monitor.
// Kelvin labels are nominal, not a calibrated physical white-point conversion.
// All gains <= 1: warmth attenuates channels instead of boosting red.
vec3 temperatureGain(float kelvin) {
    if (kelvin < 3500.0)
        return mix(vec3(1.0, 0.67, 0.36), vec3(1.0, 0.80, 0.58),
                   clamp((kelvin - 2700.0) / 800.0, 0.0, 1.0));
    if (kelvin < 4500.0)
        return mix(vec3(1.0, 0.80, 0.58), vec3(1.0, 0.89, 0.76),
                   (kelvin - 3500.0) / 1000.0);
    if (kelvin < 5500.0)
        return mix(vec3(1.0, 0.89, 0.76), vec3(1.0, 0.96, 0.89),
                   (kelvin - 4500.0) / 1000.0);
    if (kelvin < 6500.0)
        return mix(vec3(1.0, 0.96, 0.89), vec3(1.0),
                   (kelvin - 5500.0) / 1000.0);
    return mix(vec3(1.0), vec3(0.90, 0.95, 1.0),
               clamp((kelvin - 6500.0) / 1000.0, 0.0, 1.0));
}

vec3 descansoVisual(vec3 color) {
    // Endpoint-preserving, monotonic contrast curve across the entire UI range.
    // Unlike a clipped affine curve, it does not crush shadows at high contrast.
    color += 2.0 * (CONTRAST - 1.0) * color * (1.0 - color) * (2.0 * color - 1.0);

    // Perceptual luma approximation on the display-referred vanilla buffer.
    float luma = dot(color, vec3(0.2126, 0.7152, 0.0722));
    vec3 chroma = (color - vec3(luma)) * SATURATION;
    // Scale chroma to fit the RGB cube, preserving hue instead of clipping it.
    float chromaScale = 1.0;
    for (int i = 0; i < 3; i++) {
        if (chroma[i] > 0.0)
            chromaScale = min(chromaScale, (1.0 - luma) / chroma[i]);
        else if (chroma[i] < 0.0)
            chromaScale = min(chromaScale, -luma / chroma[i]);
    }
    color = clamp(vec3(luma) + chroma * chromaScale, 0.0, 1.0);

    // Smooth highlight roll-off: identity at zero, monotonic for HIGHLIGHTS <= 1.
    vec3 square = color * color;
    color -= 0.25 * HIGHLIGHTS * square * square;

    // Pedestal and white ceiling are independent of the contrast pivot.
    color = vec3(BLACK_LEVEL) + (WHITE_LEVEL - BLACK_LEVEL) * color;
    return color * temperatureGain(float(TEMPERATURE));
}

void main() {
    vec4 source = texture2D(colortex0, texcoord);
    vec3 filtered = descansoVisual(clamp(source.rgb, 0.0, 1.0));
    gl_FragColor = vec4(mix(source.rgb, filtered, FILTER_STRENGTH), source.a);
}
