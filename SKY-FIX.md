# EyeComfort Shader 1.0 — cielo / sky

## Español

El programa skybasic anterior emitía el color de los vértices sin niebla. Esto puede dejar visible el límite del disco del cielo frente al fondo, como la línea de la captura nocturna del usuario.

Ahora los discos sólidos del cielo y del vacío se mezclan con fogColor cerca del horizonte mediante una transición suave por fragmento. La dirección se convierte del espacio de cámara al del mundo para mantener estable el fundido al mirar arriba o abajo. Las etapas de estrellas y atardecer conservan su color y transparencia. No se modifica el filtro de descanso visual.

Instala EyeComfort Shader 1.0.zip sin descomprimir en shaderpacks y selecciónalo en Iris. Incluye la corrección de líneas; instala el ZIP como un pack independiente. La compilación y las pruebas GPU pasan, pero el resultado visual todavía debe verificarse dentro del juego.

## English

The previous skybasic program wrote vertex colors without fog, exposing the edge of the finite sky disc against the background. Solid sky and void discs now blend into fogColor near the world horizon with a smooth per-fragment transition. Inverse camera rotation keeps the fade aligned with the world. Stars and sunrise/sunset retain their color and alpha. Eye comfort grading is unchanged.

Install the new ZIP as a separate pack and select it in Iris. The line-program fix is included. Compilation and GPU pixel tests pass; in-game visual verification is pending.

## Implementation references

- [Iris render-stage macros](https://shaders.properties/current/reference/macros/render_stages/)
- [Iris 1.21.11 sky stage assignments](https://github.com/IrisShaders/Iris/blob/1.21.11/common/src/main/java/net/irisshaders/iris/mixin/MixinSkyRenderer.java)

HOTFIX.md documents the line-program configuration.
