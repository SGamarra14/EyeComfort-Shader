#version 120

varying vec4 ecSkyColor;
varying vec3 ecSkyViewPosition;

void main() {
    gl_Position = ftransform();
    ecSkyColor = gl_Color;
    ecSkyViewPosition = (gl_ModelViewMatrix * gl_Vertex).xyz;
}
