import 'package:calupeu/theme/theme-blue.dart';
import 'package:calupeu/theme/theme-green.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static Color colorX = Color(0xff99ff05);
  static List<Color> colorOptions = [
    Colors.purple,
    Colors.green,
    Colors.teal,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    colorX,
  ];
  AppTheme._(); // Esto es un constructor privado para evitar que se instancie la clase.

  static List<String> colorText = <String>[
    "Purple",
    "Green",
    "Teal",
    "Yellow",
    "Orange",
    "Pink",
    "Personalizado",
  ];
 static TextTheme textTheme = TextTheme(
  headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  headline2: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
 // Añade más estilos de texto según necesites
  );
  static List<ColorScheme> colorOptionsShemeL = [
 MaterialThemeBlue(textTheme).light().colorScheme,
 //lightColorSchemeBlue,
 MaterialThemeBlue(textTheme).lightMediumContrast().colorScheme,
 MaterialThemeBlue(textTheme).lightHighContrast().colorScheme,
 MaterialThemeGreen(textTheme).light().colorScheme
 ];
 static List<ColorScheme> colorOptionsShemeD = [
 MaterialThemeBlue(textTheme).dark().colorScheme,
 //darkColorSchemeBlue,
 MaterialThemeBlue(textTheme).darkMediumContrast().colorScheme,
 MaterialThemeBlue(textTheme).darkHighContrast().colorScheme,
 MaterialThemeGreen(textTheme).dark().colorScheme
 ];
  static List<Color> colorOptionsLD = <Color>[Colors.blue, Colors.lightBlue, Colors.lightBlueAccent, Colors.green];
  
  static List<String> colorTextLD = <String>["Blue", "BlueL", "BlueLI", "Green"];
  
  static ThemeData themeDataLight=ThemeData(useMaterial3: useMaterial3,
     colorScheme: AppTheme.colorOptionsShemeL[AppTheme.colorSelected]);
  static ThemeData themeDataDark=ThemeData(useMaterial3: useMaterial3,
     colorScheme: AppTheme.colorOptionsShemeD[AppTheme.colorSelected]);
  static bool useMaterial3 = false;
  static bool useLightMode = true;
  static int colorSelected = 1;

  static ThemeData themeData = ThemeData(
   

    useMaterial3: useMaterial3,
    brightness: useLightMode ? Brightness.light : Brightness.dark,
  );
  // Comentario: Aquí defines el tema de la aplicación, incluyendo el color primario, el modo de brillo y si se usará Material 3.
}
