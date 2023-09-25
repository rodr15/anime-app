# Proyecto de Aplicación de Anime

## Descripción del Proyecto

**Descripción General:**
Este proyecto es una aplicación de anime altamente funcional y responsive que permite a los usuarios explorar, descubrir y gestionar su experiencia de anime de manera personalizada. Proporciona acceso a una amplia gama de información sobre animes, opciones de personalización y características de interacción.

## Funcionalidades Clave

- **Búsqueda de Anime:** Los usuarios pueden buscar y obtener información detallada sobre cualquier anime.
- **Listas Personalizadas:** Creación y gestión de listas personalizadas de animes, como "Para Ver" o "Favoritos".
- **Cambio de Idioma:** Opciones de cambio de idioma para adaptarse a las preferencias de los usuarios.
- **Tema Personalizable:** Los usuarios pueden cambiar el tema de la aplicación según su preferencia.
- **Calificaciones y Seguimiento:** Marcar animes como "Vistos" y darles calificaciones.
- **Recomendaciones Personalizadas:** Ofrece recomendaciones de animes basadas en las interacciones y calificaciones del usuario.
- **Responsiva:** La aplicación es responsive y accesible en varios dispositivos.

## Objetivo del Proyecto

El objetivo principal es proporcionar a los amantes del anime una aplicación versátil y completa que mejore su experiencia al proporcionar acceso a información actualizada, opciones de personalización y recomendaciones precisas.

## Cómo Descargar y Ejecutar el Proyecto

Para descargar y ejecutar este proyecto, siga los siguientes pasos:

1. **Clonar el Repositorio:**
   
   ```shell
   git clone [URL_DEL_REPOSITORIO]
   cd nombre-del-proyecto

2. **Instalar dependencias:**
   
   ```shell
   flutter pub get

3. **Crear los archivos de ISAR y freezed**:
   
   ```shell
    flutter packages pub run build_runner watch --delete-conflicting-outputs

4. **Crear los archivos de internacionalización:**
   
   ```shell
    flutter pub run intl_utils:generate

    flutter  gen-l10n

5. **Analizar la aplicación:**
   ```shell
         flutter analyze

7. **Compilar y Ejecutar la Aplicación:**

    ```shell
        flutter run


## Cómo realizar los test del proyecto con coverage 

```shell
   flutter test --coverage
   genhtml coverage/lcov.info -o coverage/html