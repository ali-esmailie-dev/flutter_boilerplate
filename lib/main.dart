import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app.dart';
import 'package:flutter_boilerplate/core/localization/i18n/translations.g.dart';
import 'package:flutter_boilerplate/core/locator/locator.dart';
import 'package:flutter_boilerplate/core/utils/locale_handler.dart';
import 'package:flutter_boilerplate/features/authentication_feature/presentation/bloc/profile_bloc.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/counter_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/primary_color_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/show_material_grids_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/show_performance_overlay_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/theme_cubit.dart';
import 'package:flutter_boilerplate/features/stores_feature/presentation/bloc/stores_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Setup all get_it locators
  setupStoreLocators();
  setupAuthenticationLocators();

  /// Affect the browser's URL bar in flutter web app
  GoRouter.optionURLReflectsImperativeAPIs = true;

  /// Remove hash (#) from URL in flutter web app
  setUrlStrategy(PathUrlStrategy());

  /// Remove the native splash screen
  FlutterNativeSplash.remove();

  /// Get locale from device storage and set it
  LocaleSettings.setLocale(await LocaleHandler().getLocale());

  runApp(
    /// Provide all global blocs
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (final BuildContext context) => CounterCubit()),
        BlocProvider(
          create: (final BuildContext context) => ShowPerformanceOverlayCubit(),
        ),
        BlocProvider(
          create: (final BuildContext context) => ShowMaterialGridsCubit(),
        ),
        BlocProvider(create: (final BuildContext context) => ThemeCubit()),
        BlocProvider(
          create: (final BuildContext context) => PrimaryColorCubit(),
        ),
        BlocProvider(
          create: (final BuildContext context) => BottomNavigationCubit(),
        ),
        BlocProvider(
          create: (final BuildContext context) => locator<StoresBloc>(),
        ),
        BlocProvider(
          create: (final BuildContext context) => locator<ProfileBloc>(),
        ),
      ],

      /// Provide slang translation
      child: TranslationProvider(
        child: BlocBuilder<ShowPerformanceOverlayCubit, bool>(
          builder: (final context, final showPerformanceOverlayState) {
            return BlocBuilder<ShowMaterialGridsCubit, bool>(
              builder: (final context, final showMaterialGridsState) {
                return BlocBuilder<ThemeCubit, ThemeMode?>(
                  builder: (final BuildContext context,
                      final ThemeMode? themeState) {
                    return BlocBuilder<PrimaryColorCubit, PrimaryColorState>(
                      builder: (
                        final BuildContext context,
                        final PrimaryColorState state,
                      ) {
                        return App(
                          showPerformanceOverlay: showPerformanceOverlayState,
                          showMaterialGrids: showMaterialGridsState,
                          themeMode: themeState,
                          primaryColor: state.primaryColor,
                          lightPrimaryColor: state.lightPrimaryColor,
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    ),
  );
}
