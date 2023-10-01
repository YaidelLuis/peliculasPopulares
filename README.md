# peliculas_populares v1.0

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Instrucciones para correr proyecto en VSCode:

Para desplegar la app en VSCode cargue el proyecto y seleccione el dispositivo (fisico conectado por usb o emulador virtual generado por Android Studio) y debuguear con F5., asegurese de tener una coexion estable a internet para que se instalen correctamente los paquetes definidos .

## Pruebas unitarias:
Para realizar pruebas unitarias acceder al directorio peliculas_populares/test/unit_test y ahi se encuentra el archivo movie_bloc_test.dart, en este archivo esta enfocado a realizar 3 pruebas unitarias a la logica del bloc el cual es quien maneja los estados y enventos de la app.

Ejecuta las pruebas usando:

VSCode
    1- Abre el archivo movie_bloc_test.dart
    2- Selecciona una opcion la Run | Debug (del group o de cada una de las test por individual)
    3- Revisar respuesta del testing en la consola de Debug

También puedes usar una terminal para ejecutar nuestras pruebas ejecutando el siguiente comando desde la raíz del proyecto:
    flutter test test/movie_bloc_test.dart
