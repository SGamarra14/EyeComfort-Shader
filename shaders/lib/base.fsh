/* DRAWBUFFERS:0 */
varying vec4 dvVertexColor;
#if DV_TEXTURED == 1
uniform sampler2D gtexture;
varying vec2 dvTexcoord;
#endif
#if DV_LIGHTMAP == 1
uniform sampler2D lightmap;
varying vec2 dvLightcoord;
#endif
#if DV_ENTITY == 1
uniform vec4 entityColor;
#endif
#if DV_FOG == 1
#include "/lib/fog.glsl"
varying vec3 dvViewPosition;
#endif

void main() {
    vec4 dvSurface = dvVertexColor;
#if DV_TEXTURED == 1
    dvSurface *= texture2D(gtexture, dvTexcoord);
#endif
#if DV_ENTITY == 1
    dvSurface.rgb = mix(dvSurface.rgb, entityColor.rgb, entityColor.a);
#endif
#if DV_LIGHTMAP == 1
    dvSurface.rgb *= texture2D(lightmap, clamp(dvLightcoord, vec2(0.5 / 16.0), vec2(15.5 / 16.0))).rgb;
#endif
#if DV_FOG == 1
    float dvFog = ecFogAmount(dvViewPosition);
    dvSurface.rgb = mix(dvSurface.rgb, fogColor, dvFog);
#endif
    // Iris inserts the render-type alpha test for this legacy output syntax.
    gl_FragData[0] = dvSurface;
}
