# hora_pastilla

Un nuevo proyecto Flutter.

## Tabla de Contenidos

1. [Introducción](#introducción)
2. [Configuración de Firebase](#configuración-de-firebase)
    - [Crear un Proyecto de Firebase](#crear-un-proyecto-de-firebase)
    - [Registrar tu Aplicación en Firebase](#registrar-tu-aplicación-en-firebase)
    - [Descargar `google-services.json`](#descargar-google-servicesjson)
    - [Actualizar Archivos `build.gradle`](#actualizar-archivos-buildgradle)
        - [android/build.gradle](#androidbuildgradle)
        - [android/app/build.gradle](#androidappbuildgradle)
3. [Conclusión](#conclusión)

## Introducción

Este proyecto es un punto de partida para una aplicación Flutter.

Aquí tienes algunos recursos para comenzar si es tu primer proyecto en Flutter:

- [Laboratorio: Escribe tu primera aplicación Flutter](https://docs.flutter.dev/get-started/codelab)
- [Recetario: Ejemplos útiles de Flutter](https://docs.flutter.dev/cookbook)

Para obtener ayuda sobre el desarrollo en Flutter, consulta la
[documentación en línea](https://docs.flutter.dev/), que ofrece tutoriales, ejemplos, orientación sobre desarrollo móvil y una referencia completa de la API.

## Configuración de Firebase

Para configurar Firebase para el proyecto `hora_pastilla`, sigue estos pasos:

### IMPORTANTE: Nombre de la Organización

**Al registrar tu aplicación, usa el siguiente nombre de organización:**

`com.hr.horapastilla`



### Crear un Proyecto de Firebase

- Ve a la [Consola de Firebase](https://console.firebase.google.com/).
- Haz clic en "Agregar Proyecto" e ingresa `hora-pastilla` como el nombre del proyecto.
- Sigue los pasos para crear el proyecto.

### Registrar tu Aplicación en Firebase

- En tu proyecto de Firebase, navega a "Configuración del Proyecto" > "General".
- Haz clic en "Agregar Aplicación" y selecciona el ícono de Android.
- Usa el nombre del paquete especificado arriba: `com.hr.horapastilla`.

### Descargar `google-services.json`

- Después de registrar tu aplicación, descarga el archivo `google-services.json`.
- Coloca el archivo `google-services.json` en el directorio `android/app` de tu proyecto Flutter.

### Actualizar Archivos `build.gradle`

#### android/build.gradle

En tu archivo `android/build.gradle`, asegúrate de tener la siguiente configuración:

```groovy
buildscript {
    repositories {
        google() // Repositorio de Google
        mavenCentral() // Repositorio central de Maven
    }
    dependencies {
        // Añadir el plugin de Google Services
        classpath 'com.google.gms:google-services:4.3.15'
    }
}

plugins {
    // Otros plugins que puedas tener
    id 'com.google.gms.google-services' version '4.3.15' apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = "../build"
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}

```
#### android/build.gradle

En tu archivo `android/app/build.gradle`, incluye la configuración de FlutterFire:

```groovy
plugins {
    id "com.android.application"
    // START: FlutterFire Configuration
    id 'com.google.gms.google-services'
    // END: FlutterFire Configuration
    id "kotlin-android"
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id "dev.flutter.flutter-gradle-plugin"
}

android {
    namespace = "com.hr.horapastilla"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_1_8
    }

    defaultConfig {
        applicationId = "com.hr.horapastilla"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.debug
        }
    }
}

dependencies {
    // Import the Firebase BoM
    implementation platform('com.google.firebase:firebase-bom:33.4.0')

    // Add Firebase products
    implementation 'com.google.firebase:firebase-analytics'
    // Add other Firebase dependencies as needed
}
    
flutter {
    source = "../.."
}

```
