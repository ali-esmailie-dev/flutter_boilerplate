import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/widgets/app_scaffold.dart';
import 'package:flutter_boilerplate/core/widgets/buttons/app_button.dart';
import 'package:flutter_boilerplate/core/widgets/general_appbar.dart';
import 'package:flutter_boilerplate/core/widgets/lists/app_list_view.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/screens/animation_demo_screens/fade_scale_transition_demo.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/screens/animation_demo_screens/fade_through_transition_demo.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/screens/animation_demo_screens/open_container_transform_demo.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/screens/animation_demo_screens/shared_axis_transition_demo.dart';
import 'package:flutter_boilerplate/features/home_feature/presentation/screens/animation_demo_screens/slide_transition_demo.dart';

class PlayGround extends StatefulWidget {
  const PlayGround({super.key});

  @override
  State<PlayGround> createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: const GeneralAppBar(
        title: 'Play ground',
      ),
      smallBody: AppListView(
        children: [
          AppButton(
            title: 'Open Container Transform Demo',
            onPressed: () {
              _appNavigator(const OpenContainerTransformDemo());
            },
          ),
          AppButton(
            title: 'Shared Axis Transition Demo',
            onPressed: () {
              _appNavigator(const SharedAxisTransitionDemo());
            },
          ),
          AppButton(
            title: 'Fade Scale Transition Demo',
            onPressed: () {
              _appNavigator(const FadeScaleTransitionDemo());
            },
          ),
          AppButton(
            title: 'Fade Through Transition Demo',
            onPressed: () {
              _appNavigator(const FadeThroughTransitionDemo());
            },
          ),
          AppButton(
            title: 'Slide Transition Demo',
            onPressed: () {
              _appNavigator(const SlideTransitionDemo());
            },
          ),
        ],
      ),
    );
  }

  void _appNavigator(
    final Widget page,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (final context) => page),
    );
  }
}
