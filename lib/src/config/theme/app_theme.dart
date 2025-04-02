import 'package:saboreie/src/config/exports.dart';

abstract class AppTheme {
  static const Color defaultLightColor = Color.fromARGB(255, 201, 119, 13);
  static const String _defaultFontFamily = 'Poppins';

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color.fromRGBO(233, 233, 233, 1),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: defaultLightColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: defaultLightColor,
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        interactive: true,
        radius: const Radius.circular(8),
        thickness: WidgetStateProperty.all(8.0),
        thumbColor: WidgetStateProperty.all(const Color(0xFF6D6D6D)),
        trackColor: WidgetStateProperty.all(const Color(0xFFBDBDBD)),
      ),
      primaryColor: const Color.fromRGBO(233, 233, 233, 1),
      focusColor: defaultLightColor,
      secondaryHeaderColor: const Color.fromARGB(255, 151, 151, 151),
      splashColor: Colors.transparent,
      fontFamily: _defaultFontFamily,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color.fromRGBO(26, 32, 35, 1),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Color.fromRGBO(233, 233, 233, 1),
        ),
        bodyMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Color.fromRGBO(233, 233, 233, 1),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        interactive: true,
        radius: const Radius.circular(8),
        thickness: WidgetStateProperty.all(8.0),
        thumbColor: WidgetStateProperty.all(const Color(0xFF6D6D6D)),
        trackColor: WidgetStateProperty.all(const Color(0xFFBDBDBD)),
      ),
      primaryColor: const Color.fromARGB(255, 29, 29, 29),
      secondaryHeaderColor: const Color.fromARGB(255, 151, 151, 151),
      splashColor: Colors.transparent,
      focusColor: defaultLightColor,
      fontFamily: _defaultFontFamily,
    );
  }
}
