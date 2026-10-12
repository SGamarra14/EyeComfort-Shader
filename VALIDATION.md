# EyeComfort Shader 1.0 validation

2026-10-12: PASS — 675 GLSL compile/link pairs and 21 GPU pixel fixtures of the actual sky fragment shader. Includes horizon/disc-edge matching, daytime and nighttime colors, transition endpoints and midpoint, zenith, void, alpha, star/sunset preservation, missing-stage fallback, zero direction, and six camera rotations. Render-stage IDs in fixtures are symbolic test constants; production uses Iris macros.

The 10-branch interface audit and 11 locale key checks also passed. Color filter sources and active profile settings match the validated development baseline. The terrain fog helper matches the previously validated implementation; its previous 21 pixel tests are historical validation, not newly executed tests for this release. The explicit line program remains absent.

Renderer: NVIDIA GeForce RTX 3060, OpenGL 4.6, driver 610.88. GPU tests read RGBA32F pixels with tolerance 0.00002. Inputs are controlled constants, not live Minecraft uniforms.

These checks do not run Minecraft or the Iris shader transformer. Actual visual verification, including the user's Voxy instance, is pending. See COMPATIBILITY.md for source references and scope.

Version 1.0 changes release labels and documentation only. Executable shader sources and active settings match the archived development build. The GPU results above were obtained during development and were not rerun for this metadata-only release.
