import 'package:saboreie/src/config/exports.dart';

abstract class AppTheme {
  static const Color _defaultLightColor = Color(0xFF10151D);
  static const String _defaultFontFamily = 'Poppins';

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        brightness: Brightness.light,
        primary: Colors.teal,
        onPrimary: Colors.white,
        secondary: Colors.grey[600]!,
        onSecondary: Colors.white,
        surface: Colors.white,
        onSurface: _defaultLightColor,
        error: Colors.red,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(color: _defaultLightColor),
        titleTextStyle: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: _defaultLightColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: _defaultLightColor,
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        interactive: true,
        radius: const Radius.circular(8),
        thickness: WidgetStateProperty.all(8.0),
        thumbColor: WidgetStateProperty.all(const Color(0xFF6D6D6D)),
        trackColor: WidgetStateProperty.all(const Color(0xFFBDBDBD)),
      ),
      primaryColor: Colors.teal,
      splashColor: Colors.transparent,
      fontFamily: _defaultFontFamily,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        brightness: Brightness.dark,
        onPrimary: Colors.white,
        secondary: Colors.grey[500]!,
        onSecondary: Colors.black,
        surface: Colors.black,
        onSurface: Colors.white,
        error: Colors.red,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(26, 32, 35, 1),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        interactive: true,
        radius: const Radius.circular(8),
        thickness: WidgetStateProperty.all(8.0),
        thumbColor: WidgetStateProperty.all(const Color(0xFF6D6D6D)),
        trackColor: WidgetStateProperty.all(const Color(0xFFBDBDBD)),
      ),
      primaryColor: Colors.teal,
      splashColor: Colors.transparent,
      fontFamily: _defaultFontFamily,
    );
  }
}
