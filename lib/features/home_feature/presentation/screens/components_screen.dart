import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/localization/i18n/translations.g.dart';
import 'package:personal_portfolio/core/theme/colors.dart';
import 'package:personal_portfolio/core/theme/dimens.dart';
import 'package:personal_portfolio/core/utils/app_snack_bar.dart';
import 'package:personal_portfolio/core/utils/get_primary_color.dart';
import 'package:personal_portfolio/core/utils/locale_handler.dart';
import 'package:personal_portfolio/core/utils/number_formatter.dart';
import 'package:personal_portfolio/core/utils/screenshut_taker.dart';
import 'package:personal_portfolio/core/utils/share_helper.dart';
import 'package:personal_portfolio/core/utils/sized_context.dart';
import 'package:personal_portfolio/core/widgets/animated_switcher/animated_widget_switcher.dart';
import 'package:personal_portfolio/core/widgets/animated_switcher/animated_widget_switcher_controller.dart';
import 'package:personal_portfolio/core/widgets/app_divider.dart';
import 'package:personal_portfolio/core/widgets/app_drawer.dart';
import 'package:personal_portfolio/core/widgets/app_error_again.dart';
import 'package:personal_portfolio/core/widgets/app_loading.dart';
import 'package:personal_portfolio/core/widgets/app_menu_anchor.dart';
import 'package:personal_portfolio/core/widgets/app_no_internet.dart';
import 'package:personal_portfolio/core/widgets/app_rating_bar.dart';
import 'package:personal_portfolio/core/widgets/app_scaffold.dart';
import 'package:personal_portfolio/core/widgets/app_search_bar.dart';
import 'package:personal_portfolio/core/widgets/app_space.dart';
import 'package:personal_portfolio/core/widgets/app_stepper.dart';
import 'package:personal_portfolio/core/widgets/app_svg_viewer.dart';
import 'package:personal_portfolio/core/widgets/app_warning.dart';
import 'package:personal_portfolio/core/widgets/buttons/app_fab.dart';
import 'package:personal_portfolio/core/widgets/buttons/app_icon_button.dart';
import 'package:personal_portfolio/core/widgets/buttons/app_text_button.dart';
import 'package:personal_portfolio/core/widgets/circular_reveal_animation/circular_reveal_animation.dart';
import 'package:personal_portfolio/core/widgets/general_appbar.dart';
import 'package:personal_portfolio/core/widgets/image_swiper.dart';
import 'package:personal_portfolio/core/widgets/lists/app_list_view.dart';
import 'package:personal_portfolio/core/widgets/typography/app_copyable_text.dart';
import 'package:personal_portfolio/core/widgets/typography/app_read_more_text.dart';
import 'package:personal_portfolio/core/widgets/typography/app_text.dart';
import 'package:personal_portfolio/core/widgets/typography/app_title_large_text.dart';
import 'package:personal_portfolio/core/widgets/typography/app_title_text.dart';

class ComponentsScreen extends StatefulWidget {
  const ComponentsScreen({super.key});

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late final WidgetSwitcherController awsController1;
  late final WidgetSwitcherController awsController2;
  int selectedDrawerIndex = 0;
  int selectedStepperIndex = 1;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    awsController1 = AnimatedWidgetSwitcherController();
    awsController2 = AnimatedWidgetSwitcherController();
  }

  @override
  void dispose() {
    animationController.dispose();
    awsController1.dispose();
    awsController2.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        AppScaffold(
          appBar: GeneralAppBar(
            title: 'Components',
            actions: [
              AppMenuAnchor(
                menuChildren: [
                  MenuItemButton(
                    child: const Text('Menu 1'),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    child: const Text('Menu 2'),
                    onPressed: () {},
                  ),
                  MenuItemButton(
                    child: const Text('Menu 3'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          drawer: AppDrawer(
            selectedIndex: selectedDrawerIndex,
            onDestinationSelected: (final int index) {
              setState(() {
                selectedDrawerIndex = index;
              });
            },
          ),
          body: AppListView(
            shrinkWrap: true,
            children: [
              const AppVSpace(),
              ImageSwiper(
                width: context.widthPx,
                height: 200,
                imageList: const <String>[
                  'https://4kwallpapers.com/images/walls/thumbs_2t/6718.png',
                  'https://4kwallpapers.com/images/walls/thumbs_2t/10974.jpg',
                  'https://4kwallpapers.com/images/walls/thumbs_2t/6723.png',
                ],
              ),
              const AppVSpace(),
              AppSearchBar(
                barHintText: 'Sample search bar',
                suggestionsBuilder: (
                  final BuildContext context,
                  final SearchController controller,
                ) {
                  return getSuggestions(controller);
                },
              ),
              const AppVSpace(),
              AppSearchBar(
                barHintText: 'Full screen search bar',
                suggestionsBuilder: (
                  final BuildContext context,
                  final SearchController controller,
                ) {
                  return getSuggestions(controller);
                },
                isFullScreen: true,
              ),
              const AppVSpace(),
              AppSearchBar(
                barHintText: 'loading search bar',
                suggestionsBuilder: (
                  final BuildContext context,
                  final SearchController controller,
                ) {
                  return getSuggestions(controller);
                },
                barLeading: const AppLoading(
                  width: 28,
                ),
              ),
              const AppVSpace(
                space: Dimens.largePadding,
              ),
              const Text('Loading bar'),
              const AppVSpace(),
              const AppLoading(),
              const Text('Rating bar'),
              const AppVSpace(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppRatingBar(rate: 1),
                  AppHSpace(),
                  AppRatingBar(rate: 5),
                ],
              ),
              const AppVSpace(),
              const AppText('SVG viewer'),
              const AppVSpace(),
              const AppSvgViewer(
                path: 'assets/images/sample.svg',
                width: 200,
                height: 200,
                setDefaultColorStatus: false,
              ),
              const AppVSpace(),
              const AppText('Animated widget switcher'),
              const AppVSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedWidgetSwitcher(
                    controller: awsController1,
                    onTap: () {},
                    size: 50,
                    children: const [
                      Icon(Icons.menu),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  const AppHSpace(),
                  AnimatedWidgetSwitcher(
                    controller: awsController2,
                    onTap: () {},
                    size: 50,
                    children: const [
                      AppSvgViewer(
                        path: 'assets/icons/play.svg',
                        width: 200,
                        height: 200,
                      ),
                      AppSvgViewer(
                        path: 'assets/icons/pause.svg',
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                ],
              ),
              const AppVSpace(),
              const AppDivider(),
              const AppVSpace(),
              AppErrorAgain(
                onReloadButtonTap: () {},
              ),
              const AppVSpace(),
              const AppDivider(),
              const AppVSpace(),
              AppNoInternet(
                onReloadButtonTap: () {},
              ),
              const AppVSpace(),
              AppTextButton(
                title: 'SHOW SNACK BAR',
                onPressed: () {
                  showSnackBar(
                    'THIS IS SIMPLE SNACK BAR!',
                  );
                },
              ),
              AppTextButton(
                title: 'SHOW SUCCESS SNACK BAR',
                onPressed: () {
                  showSnackBar(
                    'THIS IS SIMPLE SNACK BAR!',
                    snackBarType: SnackBarType.success,
                  );
                },
              ),
              AppTextButton(
                title: 'SHOW ERROR SNACK BAR',
                onPressed: () {
                  showSnackBar(
                    'THIS IS SIMPLE SNACK BAR!',
                    snackBarType: SnackBarType.error,
                  );
                },
              ),
              AppTextButton(
                title: 'SHOW WARNING SNACK BAR',
                onPressed: () {
                  showSnackBar(
                    'THIS IS SIMPLE SNACK BAR!',
                    snackBarType: SnackBarType.warning,
                  );
                },
              ),
              AppTextButton(
                title: 'SHOW INFO SNACK BAR',
                onPressed: () {
                  showSnackBar(
                    'THIS IS SIMPLE SNACK BAR!',
                    snackBarType: SnackBarType.info,
                  );
                },
              ),
              AppTextButton(
                title: 'SHOW SNACK BAR WITH ACTION',
                onPressed: () {
                  showSnackBar(
                    'THIS IS SIMPLE SNACK BAR!',
                    action: SnackBarAction(
                      label: 'action',
                      onPressed: () {},
                    ),
                  );
                },
              ),
              AppTextButton(
                title: 'SHOW SNACK BAR WITH ICON',
                onPressed: () {
                  showSnackBar(
                    'THIS IS SIMPLE SNACK BAR!',
                    icon: Icons.home_outlined,
                  );
                },
              ),
              AppTextButton(
                title: 'SHARE TEXT',
                onPressed: () {
                  ShareHelper.shareText(
                    'Simple text to share',
                    subject: t.loremIpsum,
                  );
                },
              ),
              AppTextButton(
                title: 'SHARE SCREENSHOT',
                onPressed: () {
                  shareScreenShutTaker(
                    context: context,
                    child: const Text('test'),
                    screenshotHeight: 100,
                    screenshotWidth: 100,
                  );
                },
              ),
              const AppVSpace(),
            ],
          ),
          secondaryBody: Column(
            children: [
              const AppTitleLargeText('Typography'),
              SizedBox(
                width: context.sizePx.width,
                child: Column(
                  crossAxisAlignment: checkEnState(context)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    const AppVSpace(),
                    const AppTitleLargeText('Title large'),
                    const AppTitleText('Title medium'),
                    AppText(
                      'Body bold',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const AppText('Body medium'),
                    AppText(
                      'Body small',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const AppVSpace(),
                    AppText(numberFormatter(context, 25000000)),
                    const AppVSpace(),
                    AppText(
                      doubleNumberFormatter(
                        context,
                        255555.34343434,
                        decimalDigit: 1,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                    const AppVSpace(),
                    const AppCopyableText(text: 'Click to Copy'),
                    const AppVSpace(),
                    AppReadMoreText(t.loremIpsum),
                    const AppVSpace(),
                    const Center(child: AppTitleLargeText('Warning Widget')),
                    const AppVSpace(),
                    AppWarning(
                      warningText: t.smallLoremIpsum,
                    ),
                    const AppVSpace(),
                    const Center(child: AppTitleLargeText('Stepper')),
                    const AppVSpace(),
                    AppStepper(
                      totalSteps: 3,
                      currentStepIndex: selectedStepperIndex,
                      stepNames: const ['Step 1', 'Step 2', 'Step 3'],
                      stepDescriptions: const [
                        'Step desc 1',
                        'Step desc 2',
                        'Step desc 3',
                      ],
                      onTap: (final value) {
                        setState(() {
                          selectedStepperIndex = value;
                        });
                      },
                      trailing: const Text(
                        'edit',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    const AppVSpace(
                      space: 32.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: AppFab(
            onPressed: () {
              if (animationController.status == AnimationStatus.forward ||
                  animationController.status == AnimationStatus.completed) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
            icon: Icons.animation,
            label: 'Simple animation',
            isExtended: true,
          ),
        ),
        SizedBox(
          height:
              context.heightPx - (MediaQuery.of(context).padding.bottom + 75),
          child: CircularRevealAnimation(
            animation: animation,
            centerAlignment: Alignment.bottomLeft,
            minRadius: 0,
            maxRadius: context.widthPx * 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: context.widthPx,
                height: 200,
                color: getPrimaryColor(context),
                child: Row(
                  children: [
                    AppIconButton(
                      icon: Icons.close,
                      onPressed: () {
                        animationController.reverse();
                      },
                      iconColor: AppColors.white,
                    ),
                    AppText(
                      'Simple animation',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<ColorItem> searchHistory = <ColorItem>[];

  Iterable<Widget> getSuggestions(final SearchController controller) {
    final String input = controller.value.text;
    return ColorItem.values
        .where((final ColorItem color) => color.label.contains(input))
        .map(
          (final ColorItem filteredColor) => ListTile(
            leading: CircleAvatar(backgroundColor: filteredColor.color),
            title: Text(filteredColor.label),
            trailing: IconButton(
              icon: const Icon(Icons.call_missed),
              onPressed: () {
                controller.text = filteredColor.label;
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              },
            ),
            onTap: () {
              controller.closeView(filteredColor.label);
              handleSelection(filteredColor);
            },
          ),
        );
  }

  void handleSelection(final ColorItem color) {
    setState(() {
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      searchHistory.insert(0, color);
    });
  }
}

enum ColorItem {
  red('red', Colors.red),
  orange('orange', Colors.orange),
  yellow('yellow', Colors.yellow),
  green('green', Colors.green),
  blue('blue', Colors.blue),
  indigo('indigo', Colors.indigo),
  violet('violet', Color(0xFF8F00FF)),
  purple('purple', Colors.purple),
  pink('pink', Colors.pink),
  silver('silver', Color(0xFF808080)),
  gold('gold', Color(0xFFFFD700)),
  beige('beige', Color(0xFFF5F5DC)),
  brown('brown', Colors.brown),
  grey('grey', Colors.grey),
  black('black', Colors.black),
  white('white', Colors.white);

  const ColorItem(this.label, this.color);

  final String label;
  final Color color;
}
