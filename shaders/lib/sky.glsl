#ifndef EYECOMFORT_SKY_GLSL
#define EYECOMFORT_SKY_GLSL

vec4 ecBlendSkyHorizon(vec4 color, vec3 horizonColor, vec3 direction, int stage) {
    bool skyDisc = false;
#ifdef MC_RENDER_STAGE_SKY
    skyDisc = skyDisc || stage == MC_RENDER_STAGE_SKY;
#endif
#ifdef MC_RENDER_STAGE_VOID
    skyDisc = skyDisc || stage == MC_RENDER_STAGE_VOID;
#endif
    // Stars and the translucent sunrise/sunset fan share this program.
    // Leave their color and alpha intact; only the solid discs need this fade.
    if (skyDisc) {
        float elevation = abs(direction.y) / max(length(direction), 0.0001);
        // Reach fogColor before the outer edge of vanilla's finite sky disc.
        // A flat end to the smoothstep also hides its polygonal silhouette.
        float skyWeight = smoothstep(0.08, 0.35, elevation);
        color.rgb = mix(horizonColor, color.rgb, skyWeight);
    }
    return color;
}

#endif
