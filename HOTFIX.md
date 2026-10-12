# EyeComfort Shader 1.0 — line rendering / líneas

## English

Lines inherit the pack's existing Basic program. The ZIP intentionally omits gbuffers_line.vsh and gbuffers_line.fsh because Iris forces an explicit line program through its core transformation path, even for GLSL 1.20 input. This resolves a compilation error reported during development on Minecraft 1.21.11.

Install EyeComfort Shader 1.0.zip as a separate pack. Do not mix extracted files with older development builds. Offline compilation and fallback checks pass; these checks do not execute Minecraft. Dedicated Voxy support is not claimed.

## Español

Las líneas heredan el programa básico incluido en el pack. El ZIP omite intencionalmente gbuffers_line.vsh y gbuffers_line.fsh porque Iris fuerza ese programa explícito a su ruta core, incluso con código GLSL 1.20. Esta configuración corrige un error de compilación comunicado durante el desarrollo en Minecraft 1.21.11.

Instala EyeComfort Shader 1.0.zip como un pack independiente. No mezcles archivos extraídos con versiones de desarrollo anteriores. Las comprobaciones de compilación y selección del programa básico pasan, pero no ejecutan Minecraft. No se declara integración específica con Voxy.

## References

- https://github.com/IrisShaders/Iris/blob/1.21.11/common/src/main/java/net/irisshaders/iris/pipeline/transform/TransformPatcher.java
- https://github.com/IrisShaders/Iris/blob/1.21.11/common/src/main/java/net/irisshaders/iris/pipeline/IrisRenderingPipeline.java
- https://github.com/IrisShaders/Iris/blob/1.21.11/common/src/main/java/net/irisshaders/iris/shaderpack/programs/ProgramFallbackResolver.java
