import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/localization/i18n/translations.g.dart';
import 'package:flutter_boilerplate/core/routes/go_router_routes.dart';
import 'package:flutter_boilerplate/core/theme/theme.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

/// Global key used for show snackBar without context
final GlobalKey<ScaffoldMessengerState> globalScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class App extends StatelessWidget {
  const App({
    super.key,
    this.themeMode,
    required this.primaryColor,
    required this.lightPrimaryColor,
    required this.showMaterialGrids,
    required this.showPerformanceOverlay,
  });

  final ThemeMode? themeMode;
  final Color primaryColor;
  final Color lightPrimaryColor;
  final bool showPerformanceOverlay;
  final bool showMaterialGrids;

  @override
  Widget build(final BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      title: 'flutter_boilerplate',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: showMaterialGrids,
      showPerformanceOverlay: showPerformanceOverlay,
      scaffoldMessengerKey: globalScaffoldMessengerKey,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: AppTheme(context, primaryColor, lightPrimaryColor).lightTheme,
      darkTheme: AppTheme(context, primaryColor, lightPrimaryColor).darkTheme,
      themeMode: themeMode,
    );
  }
}
