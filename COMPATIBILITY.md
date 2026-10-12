# EyeComfort Shader 1.0 — compatibility / compatibilidad

**1.0 — Initial public release / Primera versión pública.**

Reviewed / revisado: 2026-10-12.

## Estado real

**Un único ZIP, preparado para Minecraft Java 1.20.x, 1.21.x y 26.1–26.3 con Iris.** No necesitas elegir una edición del pack por versión. La detección de versión selecciona automáticamente la ruta de niebla.

Una versión de desarrollo fue confirmada por el usuario dentro de su instancia 1.21.11. La versión 1.0 todavía no se ha ejecutado en Minecraft durante esta revisión, ni siquiera en 1.21.11. No se declara que todas las versiones de la tabla hayan sido probadas en una partida. Las próximas versiones de 26.x requieren revisión; no se prometen por anticipado.

## Real status

**One ZIP targeting Minecraft Java 1.20.x, 1.21.x and 26.1–26.3 with Iris.** Version detection selects the fog path automatically; no per-version pack selection is needed.

The user confirmed an earlier development build works in their 1.21.11 instance. Release 1.0 has not been launched in Minecraft during this review, including on 1.21.11. No claim is made that every version below has been tested in-game. Future 26.x versions require review.

## Verificaciones / checks

| Check / comprobación | Result / resultado |
|---|---|
| Official Iris source interfaces / interfaces del código oficial | 10 branches: 1.20.1, 1.20.3, 1.20.6, 1.21.1, 1.21.5, 1.21.6, 1.21.11, 26.1, 26.2, 26.3 |
| Geometry program coverage / cobertura de geometría | 26 explicit Gbuffers programs; Line resolves to the pack's Basic program in all 10 audited branches |
| GLSL compile and link / compilación y enlace | 675 successful pairs: 27 programs × 24 version macros plus an undefined-version fallback |
| Actual GPU pixel tests / pruebas de píxeles en GPU | 21 new sky cases passed; 21 earlier fog cases retained for unchanged code; RGBA32F output, tolerance 0.00002 |
| Color filter / filtro de color | final.vsh and final.fsh byte-identical to the validated development baseline |
| Profiles and controls / perfiles y controles | Active properties unchanged; 7 controls, 4 profiles |
| Translations / traducciones | 11 locale files; matching option and profile keys |
| Driver / controlador | NVIDIA GeForce RTX 3060, OpenGL 4.6.0, driver 610.88 |
| Minecraft sessions run / sesiones de Minecraft ejecutadas | 0 for this release |

Changing MC_VERSION while compiling validates preprocessing and shader syntax, not the full Iris runtime, its transformer, actual uniform bindings, world rendering or other GPU vendors. Source review covers branch snapshots, which can differ from released binaries. GPU fog fixtures execute the actual fog helper, but use controlled constants rather than values supplied by Minecraft.

Cambiar MC_VERSION en las compilaciones comprueba el preprocesado y la sintaxis; no ejecuta Iris, su transformador, sus bindings reales, el mundo ni otros controladores. La revisión de código usa snapshots de ramas, que pueden diferir de los binarios publicados. Las pruebas de niebla ejecutan la función real con constantes controladas, no con valores enviados por Minecraft.

## Implementation / implementación

- Common GLSL 1.20 compatibility syntax; no direct Minecraft attribute names, Sodium internals, UBO layouts, compute shaders or required optional Iris features.
- Explicit programs for terrain, water, cutouts, particles, entities, translucent entities, hand, weather, clouds, sky and glints. Lines deliberately inherit the pack's basic program to avoid forced core processing. Older Iris can ignore unrecognized additional program files.
- MC_VERSION < 12106: legacy fog parameters. MC_VERSION >= 12106: environmental fog plus an approximate horizon fade using the stable far uniform for world geometry. 26.1 is encoded as 260100; no five-digit truncation.
- Fog disabled, linear, exponential and exponential-squared paths; guards for degenerate intervals and missing render distance. Sky, clouds, glints and hand do not receive the additional horizon fade.
- The modern horizon fade spans 75–100% of the configured render distance. This intentionally approximates distance fog; it is not a bit-exact reproduction of every Minecraft fog effect. The distant horizon uses a smooth fade.
- No dedicated Voxy, Distant Horizons, OptiFine or Oculus integration is claimed. Scope is Minecraft Java with Iris and its compatible Sodium dependency.

## Iris release references / publicaciones de referencia

Published stable Fabric versions reported by the official Iris project metadata on Modrinth. This table confirms loader availability, **not successful game tests of EyeComfort**. Some Iris releases cover several Minecraft patch versions. Install the Sodium dependency required by the selected Iris release; the shader ZIP does not bundle either mod.

Publicaciones estables Fabric informadas por el proyecto oficial Iris en Modrinth. La tabla confirma disponibilidad del cargador, **no pruebas del pack dentro del juego**. Usa la dependencia de Sodium indicada por cada publicación.

| Minecraft | Iris reference / referencia |
|---|---|
| 1.20 | [1.6.11+1.20.1](https://modrinth.com/mod/iris/version/ogjxrwGQ) |
| 1.20.1 | [1.7.6+1.20.1](https://modrinth.com/mod/iris/version/s5eFLITc) |
| 1.20.2 | [1.6.14+1.20.2](https://modrinth.com/mod/iris/version/Cjwm9s3i) |
| 1.20.3 | [1.7.2+1.20.4](https://modrinth.com/mod/iris/version/hq98tuSS) |
| 1.20.4 | [1.7.2+1.20.4](https://modrinth.com/mod/iris/version/hq98tuSS) |
| 1.20.5 | [1.7.2+1.20.6](https://modrinth.com/mod/iris/version/1bvcmYOc) |
| 1.20.6 | [1.7.2+1.20.6](https://modrinth.com/mod/iris/version/1bvcmYOc) |
| 1.21 | [1.8.8+1.21.1-fabric](https://modrinth.com/mod/iris/version/zsoi0dso) |
| 1.21.1 | [1.8.8+1.21.1-fabric](https://modrinth.com/mod/iris/version/zsoi0dso) |
| 1.21.2 | [1.8.0+1.21.3-fabric](https://modrinth.com/mod/iris/version/qyGMuaY6) |
| 1.21.3 | [1.8.1+1.21.3-fabric](https://modrinth.com/mod/iris/version/xQYJAYTI) |
| 1.21.4 | [1.8.8+1.21.4-fabric](https://modrinth.com/mod/iris/version/Ca054sTe) |
| 1.21.5 | [1.8.11+1.21.5-fabric](https://modrinth.com/mod/iris/version/U6evbjd0) |
| 1.21.6 | [1.9.6+1.21.8-fabric](https://modrinth.com/mod/iris/version/Rhzf61g1) |
| 1.21.7 | [1.9.6+1.21.8-fabric](https://modrinth.com/mod/iris/version/Rhzf61g1) |
| 1.21.8 | [1.9.6+1.21.8-fabric](https://modrinth.com/mod/iris/version/Rhzf61g1) |
| 1.21.9 | [1.9.7+1.21.10-fabric](https://modrinth.com/mod/iris/version/a98UkgML) |
| 1.21.10 | [1.9.7+1.21.10-fabric](https://modrinth.com/mod/iris/version/a98UkgML) |
| 1.21.11 | [1.10.8+1.21.11-fabric](https://modrinth.com/mod/iris/version/ka9PDlsN) |
| 26.1 | [1.11.4+26.1-fabric](https://modrinth.com/mod/iris/version/sZbVsl2Q) |
| 26.1.1 | [1.11.4+26.1-fabric](https://modrinth.com/mod/iris/version/sZbVsl2Q) |
| 26.1.2 | [1.11.4+26.1-fabric](https://modrinth.com/mod/iris/version/sZbVsl2Q) |
| 26.2 | [1.11.4+26.2-fabric](https://modrinth.com/mod/iris/version/gxZWWnKH) |
| 26.3 | [1.11.7+26.3-fabric](https://modrinth.com/mod/iris/version/vTN4NRGW) |

## In-game acceptance check / comprobación dentro del juego

In a test world for each target version: load the ZIP; change profiles; inspect terrain, leaves, water and glass, particles, block breaking, mobs and damage tint, held items and enchantment glints, rain, clouds, day/night, underwater/lava fog, Nether and End. Confirm no Iris compilation errors. Compare Neutral and Filter Strength 0. Keep the exact Minecraft/Iris/Sodium versions and a fresh latest.log if anything fails. Use a separate test world rather than opening an existing world in an older Minecraft version.

En un mundo de prueba de cada versión: carga el ZIP; cambia perfiles; revisa terreno, hojas, agua y cristal, partículas, rotura de bloques, entidades y tinte de daño, objetos en mano y encantamientos, lluvia, nubes, día/noche, niebla bajo agua/lava, Nether y End. Confirma que Iris no informa errores. Compara Neutro e intensidad 0. Si algo falla, conserva las versiones exactas y latest.log. Usa un mundo de prueba separado para no abrir un mundo existente en una versión anterior.

## Reproducible source references / referencias fijadas

- Iris 1.20.1: [FogUniforms](https://github.com/IrisShaders/Iris/blob/f8d7bea2ab82d21737e7aa8e4b2fb3a429078106/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/f8d7bea2ab82d21737e7aa8e4b2fb3a429078106/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 1.20.3: [FogUniforms](https://github.com/IrisShaders/Iris/blob/a640a8a3504dadfeb62a4dc8f3d98b0601e2aff0/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/a640a8a3504dadfeb62a4dc8f3d98b0601e2aff0/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 1.20.6: [FogUniforms](https://github.com/IrisShaders/Iris/blob/a0b731780f52728a079906d9f891fae53bef7d29/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/a0b731780f52728a079906d9f891fae53bef7d29/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 1.21.1: [FogUniforms](https://github.com/IrisShaders/Iris/blob/eb7afb99f747cc8ed5ee4072119539035d33cefd/common/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/eb7afb99f747cc8ed5ee4072119539035d33cefd/common/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 1.21.5: [FogUniforms](https://github.com/IrisShaders/Iris/blob/c5a6b32f74229e894b2e03677afbaa53b89d256b/common/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/c5a6b32f74229e894b2e03677afbaa53b89d256b/common/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 1.21.6: [FogUniforms](https://github.com/IrisShaders/Iris/blob/ba9af8c0c36f263026305c4c9cb9a671e389b0d6/common/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/ba9af8c0c36f263026305c4c9cb9a671e389b0d6/common/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 1.21.11: [FogUniforms](https://github.com/IrisShaders/Iris/blob/0a1fcaae55099356bf53410b4f5302753edb0ffc/common/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/0a1fcaae55099356bf53410b4f5302753edb0ffc/common/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 26.1: [FogUniforms](https://github.com/IrisShaders/Iris/blob/bff1e69cb6c5519d8745784aa9c8b92984de67e7/common/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/bff1e69cb6c5519d8745784aa9c8b92984de67e7/common/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 26.2: [FogUniforms](https://github.com/IrisShaders/Iris/blob/4ce5bb6ddd4b964b2b63442ebfca7e101ff128d0/common/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/4ce5bb6ddd4b964b2b63442ebfca7e101ff128d0/common/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)
- Iris 26.3: [FogUniforms](https://github.com/IrisShaders/Iris/blob/671a5c87747d33983d7ed659461a64f46dfcb1f0/common/src/main/java/net/irisshaders/iris/uniforms/FogUniforms.java) · [ProgramId](https://github.com/IrisShaders/Iris/blob/671a5c87747d33983d7ed659461a64f46dfcb1f0/common/src/main/java/net/irisshaders/iris/shaderpack/loading/ProgramId.java)

- Iris compatibility profiles: https://shaders.properties/current/how-to/compatibility_vs_core/
- Version macro: https://shaders.properties/current/reference/macros/mc_version/
- Iris official project releases API: https://api.modrinth.com/v2/project/iris/version
