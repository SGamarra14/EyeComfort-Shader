# EyeComfort Shader 1.0

**1.0 — Initial public release / Primera versión pública.**

**Un único ZIP** preparado para Minecraft Java **1.20.x, 1.21.x y 26.1–26.3 con Iris**. Detecta la versión automáticamente; no hace falta escoger una edición diferente del shader. Consulta COMPATIBILITY.md para ver las verificaciones y referencias de Iris.

## Instalación

1. Instala Iris y su dependencia compatible de Sodium para tu versión de Minecraft.
2. Copia **EyeComfort Shader 1.0.zip**, sin descomprimir, en shaderpacks de esa instancia.
3. Selecciona el ZIP nuevo en Iris y aplica. Abre los ajustes del shader para elegir perfil o modificar controles.

Al cambiar el nombre del ZIP, Iris puede iniciar los ajustes del pack con sus valores predeterminados. Vuelve a aplicar tus valores personalizados si corresponde.

## Controles e idiomas

Temperatura, contraste, negros/pedestal, blancos, compresión de luces altas, saturación e intensidad global. Traducciones completas al inglés y español, con variantes regionales y selección según el idioma de Minecraft.

Perfiles: Neutro, Suave, Descanso visual y Noche. Descanso visual es el inicial: 4500 K orientativos, contraste 0.90, pedestal 0.025, blancos 0.90, compresión de luces altas 0.20 y saturación 0.85.

La intensidad 0 omite el filtro de color. La temperatura es una aproximación artística, no una calibración del monitor. El HUD y los menús dibujados después del mundo pueden quedar fuera del filtro.

## Portabilidad

La versión 1.0 declara 26 programas de geometría; las líneas heredan el programa básico del pack para evitar la ruta core exclusiva de gbuffers_line. Elige entre niebla clásica y niebla ambiental con un fundido aproximado por distancia desde 1.21.6, incluyendo la numeración 26.x. El filtro de color y sus valores se mantienen intactos. La versión 1.0 añade una transición suave entre el disco del cielo y el color de la niebla, siguiendo el horizonte al inclinar la cámara. Conserva las estrellas y los atardeceres. Ver SKY-FIX.md.

Pasaron 675 combinaciones de compilación/enlace y 21 nuevas pruebas de píxeles del cielo en GPU. La niebla del terreno, sin cambios, ya había superado 21 pruebas. No equivalen a ejecutar Minecraft en esas versiones: esta publicación todavía requiere pruebas dentro del juego. Una versión de desarrollo sí fue confirmada por el usuario en 1.21.11.

No se declara integración específica con Voxy o Distant Horizons. Las próximas versiones de 26.x necesitan revisión. La matriz bilingüe COMPATIBILITY.md contiene las referencias y el alcance exacto.
