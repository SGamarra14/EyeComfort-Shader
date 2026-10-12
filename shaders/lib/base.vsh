// Shared compatibility-profile geometry shader. Iris supplies missing vertex
// attributes per render type; never reference Minecraft's raw `Color` symbol.
varying vec4 dvVertexColor;
#if DV_TEXTURED == 1
varying vec2 dvTexcoord;
#endif
#if DV_LIGHTMAP == 1
varying vec2 dvLightcoord;
#endif
#if DV_FOG == 1
varying vec3 dvViewPosition;
#endif

void main() {
    gl_Position = ftransform();
    dvVertexColor = gl_Color;
#if DV_TEXTURED == 1
    dvTexcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
#endif
#if DV_LIGHTMAP == 1
    dvLightcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
#endif
#if DV_FOG == 1
    dvViewPosition = (gl_ModelViewMatrix * gl_Vertex).xyz;
#endif
}
