import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/localization/i18n/translations.g.dart';
import 'package:flutter_boilerplate/core/routes/go_routes_path.dart';
import 'package:flutter_boilerplate/core/theme/colors.dart';
import 'package:flutter_boilerplate/core/utils/locale_handler.dart';
import 'package:flutter_boilerplate/core/widgets/animated_flip_counter.dart';
import 'package:flutter_boilerplate/core/widgets/app_divider.dart';
import 'package:flutter_boilerplate/core/widgets/app_space.dart';
import 'package:flutter_boilerplate/core/widgets/buttons/app_elevated_button.dart';
import 'package:flutter_boilerplate/core/widgets/buttons/app_icon_button.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/counter_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/primary_color_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/show_material_grids_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/show_performance_overlay_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/theme_cubit.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(final BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        BlocConsumer<CounterCubit, int>(
          listener: (final BuildContext context, final int state) {},
          builder: (final BuildContext context, final int state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t.theme),
                      Switch(
                        value: Theme.of(context).brightness == Brightness.dark,
                        onChanged: (final bool value) {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                      ),
                    ],
                  ),
                  const AppDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(t.language),
                      Switch(
                        value: checkEnState(context),
                        onChanged: (final bool value) {
                          LocaleHandler().changeLocale(context);
                        },
                      ),
                    ],
                  ),
                  const AppDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Show performance overlay'),
                      BlocBuilder<ShowPerformanceOverlayCubit, bool>(
                        builder: (final context, final state) {
                          return Switch(
                            value: state,
                            onChanged: (final bool value) {
                              if (value) {
                                context
                                    .read<ShowPerformanceOverlayCubit>()
                                    .show();
                              } else {
                                context
                                    .read<ShowPerformanceOverlayCubit>()
                                    .hide();
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const AppDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Show material grids'),
                      BlocBuilder<ShowMaterialGridsCubit, bool>(
                        builder: (final context, final state) {
                          return Switch(
                            value: state,
                            onChanged: (final bool value) {
                              if (value) {
                                context.read<ShowMaterialGridsCubit>().show();
                              } else {
                                context.read<ShowMaterialGridsCubit>().hide();
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const AppDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIconButton(
                        icon: Icons.color_lens_outlined,
                        iconColor: Colors.red,
                        onPressed: () {
                          context.read<PrimaryColorCubit>().setRedColor();
                        },
                      ),
                      const AppHSpace(),
                      AppIconButton(
                        icon: Icons.color_lens_outlined,
                        iconColor: Colors.green,
                        onPressed: () {
                          context.read<PrimaryColorCubit>().setGreenColor();
                        },
                      ),
                      const AppHSpace(),
                      AppIconButton(
                        icon: Icons.color_lens_outlined,
                        iconColor: Colors.blue,
                        onPressed: () {
                          context.read<PrimaryColorCubit>().setBlueColor();
                        },
                      ),
                      const AppHSpace(),
                      AppIconButton(
                        icon: Icons.color_lens_outlined,
                        iconColor: AppColors.primaryColor,
                        onPressed: () {
                          context.read<PrimaryColorCubit>().setPurpleColor();
                        },
                      ),
                    ],
                  ),
                  const AppDivider(),
                  Text(
                    t.hello(name: checkEnState(context) ? 'ali' : 'علی'),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const AppDivider(),
                  AnimatedFlipCounter(
                    value: state,
                    style: const TextStyle(fontSize: 50),
                    thousandSeparator: ',',
                    curve: Curves.decelerate,
                  ),
                  const AppVSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        title: 'increment',
                      ),
                      AppElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).decrement();
                        },
                        title: 'decrement',
                      ),
                    ],
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      context.push(
                        '${GoRoutesPath.home}/${GoRoutesPath.nearbyStore}',
                      );
                    },
                    title: 'Show nearby stores',
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      context.push(
                        '${GoRoutesPath.home}/${GoRoutesPath.myStores}',
                      );
                    },
                    title: 'Show my stores',
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      context.push(GoRoutesPath.login);
                    },
                    title: 'Register / Login',
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      context.push(GoRoutesPath.editProfile);
                    },
                    title: 'Edit profile',
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      context.push('/not-found');
                    },
                    title: '404 Not found',
                  ),
                  AppElevatedButton(
                    onPressed: () {
                      context.push(GoRoutesPath.playGround);
                    },
                    title: 'Animation play ground',
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
