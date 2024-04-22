import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/gen/assets.gen.dart';
import 'package:personal_portfolio/core/localization/i18n/translations.g.dart';
import 'package:personal_portfolio/core/theme/dimens.dart';
import 'package:personal_portfolio/core/utils/get_primary_color.dart';
import 'package:personal_portfolio/core/utils/sized_context.dart';
import 'package:personal_portfolio/core/widgets/app_divider.dart';
import 'package:personal_portfolio/core/widgets/app_drawer.dart';
import 'package:personal_portfolio/core/widgets/app_scaffold.dart';
import 'package:personal_portfolio/core/widgets/app_space.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/about_section_widget.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/contact_section_widget.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/home_section_widget.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/portfolio_section_widget.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/resume_section_widget.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/services_section_widget.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/settings_section_widget.dart';
import 'package:personal_portfolio/features/home_feature/presentation/widgets/social_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(final BuildContext context) {
    final List<AppNavigationDestination> destinations =
        <AppNavigationDestination>[
      AppNavigationDestination(
        label: t.home,
        selectedIcon: const Icon(Icons.home),
        icon: const Icon(Icons.home_outlined),
      ),
      AppNavigationDestination(
        label: t.about,
        selectedIcon: const Icon(Icons.person),
        icon: const Icon(Icons.person_outline),
      ),
      AppNavigationDestination(
        label: t.resume,
        selectedIcon: const Icon(Icons.contact_page),
        icon: const Icon(Icons.contact_page_outlined),
      ),
      AppNavigationDestination(
        label: t.portfolio,
        selectedIcon: const Icon(Icons.business_center),
        icon: const Icon(Icons.business_center_outlined),
      ),
      AppNavigationDestination(
        label: t.services,
        selectedIcon: const Icon(Icons.design_services),
        icon: const Icon(Icons.design_services_outlined),
      ),
      AppNavigationDestination(
        label: t.contact,
        selectedIcon: const Icon(Icons.mail),
        icon: const Icon(Icons.mail_outlined),
      ),
      AppNavigationDestination(
        label: t.settings,
        selectedIcon: const Icon(Icons.settings),
        icon: const Icon(Icons.settings_outlined),
      ),
    ];
    final List<Widget> sections = [
      const HomeSectionWidget(),
      const AboutSectionWidget(),
      const ResumeSectionWidget(),
      const PortfolioSectionWidget(),
      const ServicesSectionWidget(),
      const ContactSectionWidget(),
      const SettingsSectionWidget(),
    ];
    return AppScaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          final Widget child,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
        child: sections[selectedIndex],
      ),
      // const HomeSectionWidget(),
      secondaryBody: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.padding),
        height: context.heightPx,
        child: NavigationDrawer(
          selectedIndex: selectedIndex,
          onDestinationSelected: (final index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: [
            const AppVSpace(
              space: Dimens.largePadding,
            ),
            Column(
              children: [
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: FlutterLogo(),
                ),
                const AppVSpace(
                  space: Dimens.largePadding * 2,
                ),
                Text(
                  t.myName,
                  style: TextStyle(
                    color: getPrimaryColor(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const AppVSpace(
              space: Dimens.largePadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  onTap: () {},
                  imageUrl: Assets.icons.instagramLogo.path,
                ),
                SocialIcon(
                  onTap: () {},
                  imageUrl: Assets.icons.youtubeLogo.path,
                ),
                SocialIcon(
                  onTap: () {},
                  imageUrl: Assets.icons.telegramLogo.path,
                ),
                SocialIcon(
                  onTap: () {},
                  imageUrl: Assets.icons.whatsappLogo.path,
                ),
                SocialIcon(
                  onTap: () {},
                  imageUrl: Assets.icons.githubLogo.path,
                ),
              ],
            ),
            const AppVSpace(),
            const AppDivider(),
            const AppVSpace(),
            ...destinations.map(
              (final AppNavigationDestination destination) {
                return NavigationDrawerDestination(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.padding,
                    ),
                    child: Text(destination.label),
                  ),
                  icon: destination.icon,
                  selectedIcon: destination.selectedIcon,
                );
              },
            ),
            const AppVSpace(),
          ],
        ),
      ),
    );
  }
}
