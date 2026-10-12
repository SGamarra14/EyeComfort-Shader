#ifndef EYECOMFORT_FOG_GLSL
#define EYECOMFORT_FOG_GLSL

#include "/lib/compat.glsl"

uniform vec3 fogColor;
uniform float fogStart;
uniform float fogEnd;
uniform float fogDensity;
uniform int fogMode;
uniform int fogShape;
#if EC_SPLIT_FOG == 1 && DV_DISTANCE_FOG == 1
uniform float far;
#endif

float ecFogRamp(float start, float end, float distanceToEye) {
    // Avoid undefined smoothstep behavior during transitions or missing state.
    if (end <= start) return 0.0;
    return smoothstep(start, end, distanceToEye);
}

float ecFogAmount(vec3 viewPosition) {
    // GL fog mode values are part of Iris' longstanding shader interface.
    // Respect disabled fog instead of tinting a draw with stale parameters.
    if (fogMode == 0) return 0.0;
    float sphereDistance = length(viewPosition);
    float cylinderDistance = max(length(viewPosition.xz), abs(viewPosition.y));
    float distanceToEye = fogShape == 0 ? sphereDistance : cylinderDistance;
    float amount = 0.0;
    if (fogMode == 2048) {
        amount = 1.0 - exp(-max(fogDensity, 0.0) * distanceToEye);
    } else if (fogMode == 2049) {
        float opticalDepth = max(fogDensity, 0.0) * distanceToEye;
        amount = 1.0 - exp(-opticalDepth * opticalDepth);
    } else {
        amount = ecFogRamp(fogStart, fogEnd, distanceToEye);
    }

#if EC_SPLIT_FOG == 1 && DV_DISTANCE_FOG == 1
    // New Iris exposes environmentalStart/End through fogStart/fogEnd.
    // Use its stable render-distance uniform for a separate horizon fade.
    // This is an intentional approximation; no dependency on changing UBOs.
    if (far > 0.0) {
        float horizon = ecFogRamp(0.75 * far, far, cylinderDistance);
        amount = max(amount, horizon);
    }
#endif
    return clamp(amount, 0.0, 1.0);
}

#endif
