#version 120

/* DRAWBUFFERS:0 */
uniform vec3 fogColor;
uniform mat4 gbufferModelViewInverse;
uniform int renderStage;

varying vec4 ecSkyColor;
varying vec3 ecSkyViewPosition;

#include "/lib/sky.glsl"

void main() {
    // Undo camera rotation so the transition follows the world horizon.
    vec3 skyDirection = mat3(gbufferModelViewInverse) * ecSkyViewPosition;
    gl_FragData[0] = ecBlendSkyHorizon(ecSkyColor, fogColor, skyDirection, renderStage);
}
