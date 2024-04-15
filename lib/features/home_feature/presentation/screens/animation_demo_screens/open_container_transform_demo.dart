import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_portfolio/core/localization/i18n/translations.g.dart';
import 'package:personal_portfolio/core/widgets/app_card.dart';
import 'package:personal_portfolio/core/widgets/app_open_container.dart';
import 'package:personal_portfolio/core/widgets/app_space.dart';
import 'package:personal_portfolio/core/widgets/typography/app_title_text.dart';

const double _fabDimension = 56.0;

class OpenContainerTransformDemo extends StatefulWidget {
  const OpenContainerTransformDemo({super.key});

  @override
  State<OpenContainerTransformDemo> createState() {
    return _OpenContainerTransformDemoState();
  }
}

class _OpenContainerTransformDemoState
    extends State<OpenContainerTransformDemo> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container transform'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          AppOpenContainer(
            transitionType: ContainerTransitionType.fadeThrough,
            closedBuilder:
                (final BuildContext _, final VoidCallback openContainer) {
              return _ExampleCard(openContainer: openContainer);
            },
            targetPage: const _DetailsPage(),
          ),
          AppOpenContainer(
            transitionType: ContainerTransitionType.fade,
            closedBuilder:
                (final BuildContext _, final VoidCallback openContainer) {
              return _ExampleSingleTile(openContainer: openContainer);
            },
            targetPage: const _DetailsPage(),
          ),
          const AppVSpace(),
          const AppTitleText('Simple list'),
          ...List<Widget>.generate(
            10,
                (final int index) {
              return AppOpenContainer(
                transitionType: ContainerTransitionType.fadeThrough,
                closedBuilder:
                    (final BuildContext _, final VoidCallback openContainer) {
                  return AppCard(
                    onTap: openContainer,
                    child: ListTile(
                      leading: const FlutterLogo(
                        size: 40,
                      ),
                      title: Text('List item ${index + 1}'),
                      subtitle: const Text('Secondary text'),
                    ),
                  );
                },
                targetPage: const _DetailsPage(),
              );
            },
          ),
        ],
      ),
      floatingActionButton: OpenContainer(
        openBuilder: (final BuildContext context, final VoidCallback _) {
          return const _DetailsPage(
            includeMarkAsDoneButton: false,
          );
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_fabDimension / 2),
          ),
        ),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder:
            (final BuildContext context, final VoidCallback openContainer) {
          return SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({required this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(final BuildContext context) {
    return AppCard(
      onTap: openContainer,
      height: 300,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: FlutterLogo(
                size: 100,
              ),
            ),
          ),
          ListTile(
            title: Text('Title'),
            subtitle: Text('Secondary text'),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
                  'adipiscing elit, sed do eiusmod tempor.',
            ),
          ),
        ],
      ),
    );
  }
}

class _ExampleSingleTile extends StatelessWidget {
  const _ExampleSingleTile({required this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(final BuildContext context) {
    const double height = 110.0;

    return AppCard(
      onTap: openContainer,
      height: height,
      child: Row(
        children: <Widget>[
          const Center(
            child: FlutterLogo(
              size: 80,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage({this.includeMarkAsDoneButton = true});

  final bool includeMarkAsDoneButton;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details page'),
        actions: <Widget>[
          if (includeMarkAsDoneButton)
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () => context.pop(),
              tooltip: 'Mark as done',
            ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(70.0),
              child: FlutterLogo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Title',
                ),
                const SizedBox(height: 10),
                Text(
                  t.loremIpsum,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
