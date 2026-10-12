# EyeComfort Shader 1.0

**1.0 — Initial public release / Primera versión pública.**

One shader pack ZIP targeting **Minecraft Java 1.20.x, 1.21.x and 26.1–26.3 with Iris**. Automatic version handling; no separate shader download for each Minecraft version. See COMPATIBILITY.md for verification status and exact loader references.

## Install

1. Install Iris and its compatible Sodium dependency for your Minecraft version.
2. Copy **EyeComfort Shader 1.0.zip** into that instance's shaderpacks folder, without extracting it.
3. Select the new ZIP in Iris, apply, and open Shader Pack Settings.

The new filename may reset per-pack preferences; reapply custom values if needed. Iris runs one shader pack at a time.

## Color controls and languages

Color temperature, contrast, black pedestal, white level, highlight compression, saturation and filter strength. English and Spanish option labels, tooltips and profiles follow Minecraft's selected language, with regional variants and English fallback.

| Setting | Neutral | Soft | Eye Comfort (default) | Night |
|---|---:|---:|---:|---:|
| Approximate temperature | 6500 K | 5500 K | 4500 K | 3500 K |
| Contrast | 1.00 | 0.95 | 0.90 | 0.80 |
| Black pedestal | 0.000 | 0.010 | 0.025 | 0.040 |
| White level | 1.00 | 0.95 | 0.90 | 0.80 |
| Highlight compression | 0.00 | 0.10 | 0.20 | 0.40 |
| Saturation | 1.00 | 0.95 | 0.85 | 0.75 |

Set Filter Strength to 0 to bypass color grading. The temperature is an artist-tuned approximation, not physical monitor calibration. UI rendered after the world may remain unfiltered.

## Version 1.0

Version 1.0 blends the solid sky discs into the horizon fog color, hiding their abrupt polygonal edges. The transition follows the world horizon when the camera tilts. Stars, sunrise/sunset geometry and their alpha are preserved. The color controls, translations and line-program fix remain in place.

675 shader compile/link combinations and 21 GPU sky pixel tests passed. The unchanged terrain fog helper previously passed 21 GPU tests. These are offline checks, not Minecraft playtests; visual confirmation in-game is still pending. See SKY-FIX.md and VALIDATION.md.
