import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/utils/get_primary_color.dart';
import 'package:flutter_boilerplate/core/utils/sized_context.dart';
import 'package:flutter_boilerplate/core/widgets/app_main_navigation.dart';
import 'package:flutter_boilerplate/core/widgets/app_scaffold.dart';
import 'package:flutter_boilerplate/core/widgets/general_appbar.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/screens/components_screen.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/screens/cupertino_widgets_demo_screen.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/screens/widgets_demo_screen.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<Widget> pages = [
      const AppScaffold(
        appBar: GeneralAppBar(
          title: 'Home',
        ),
        body: HomeBody(),
      ),
      const WidgetsDemoScreen(),
      const CupertinoWidgetsDemoScreen(),
      const ComponentsScreen(),
    ];
    return AppMainNavigation(
      body: IndexedStack(
        index: context.watch<BottomNavigationCubit>().state,
        children: pages,
      ),
      navigationRail: SizedBox(
        height: context.sizePx.height,
        child: NavigationRail(
          onDestinationSelected: (final int index) {
            context.read<BottomNavigationCubit>().onDestinationSelected(index);
          },
          indicatorColor: getPrimaryColor(context),
          selectedIndex: context.watch<BottomNavigationCubit>().state,
          labelType: NavigationRailLabelType.all,
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              selectedIcon: Icon(Icons.widgets),
              icon: Icon(Icons.widgets_outlined),
              label: Text('Widgets'),
            ),
            NavigationRailDestination(
              selectedIcon: Icon(Icons.widgets),
              icon: Icon(Icons.widgets_outlined),
              label: Text('iOS Widgets'),
            ),
            NavigationRailDestination(
              selectedIcon: Icon(Icons.account_tree),
              icon: Icon(Icons.account_tree_outlined),
              label: Text('Components'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (final int index) {
          context.read<BottomNavigationCubit>().onDestinationSelected(index);
        },
        indicatorColor: getPrimaryColor(context),
        selectedIndex: context.watch<BottomNavigationCubit>().state,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.widgets),
            icon: Icon(Icons.widgets_outlined),
            label: 'Widgets',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.widgets),
            icon: Icon(Icons.widgets_outlined),
            label: 'iOS Widgets',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_tree),
            icon: Icon(Icons.account_tree_outlined),
            label: 'Components',
          ),
        ],
      ),
    );
  }
}
