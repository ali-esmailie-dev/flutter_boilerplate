import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/utils/slide_transition_animations.dart';
import 'package:flutter_boilerplate/core/widgets/app_scaffold.dart';
import 'package:flutter_boilerplate/core/widgets/buttons/app_button.dart';
import 'package:flutter_boilerplate/core/widgets/general_appbar.dart';
import 'package:flutter_boilerplate/core/widgets/lists/app_list_view.dart';

class SlideTransitionDemo extends StatefulWidget {
  const SlideTransitionDemo({super.key});

  @override
  State<SlideTransitionDemo> createState() => _SlideTransitionDemoState();
}

class _SlideTransitionDemoState extends State<SlideTransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: const GeneralAppBar(
        title: 'Slide transition',
      ),
      smallBody: AppListView(
        children: [
          AppSlideTransition.fromTop(
            const FlutterLogo(
              size: 100,
            ),
            animation,
          ),
          AppSlideTransition.fromLeft(
            const FlutterLogo(
              size: 100,
            ),
            animation,
          ),
          AppSlideTransition.fromRight(
            const FlutterLogo(
              size: 100,
            ),
            animation,
          ),
          AppSlideTransition.fromBottom(
            const FlutterLogo(
              size: 100,
            ),
            animation,
          ),
          AppSlideTransition.toBottom(
            const FlutterLogo(
              size: 100,
            ),
            animation,
          ),
        ],
      ),
      bottomSheet: AppButton(
        title: 'run',
        onPressed: () {
          if (animationController.status == AnimationStatus.forward ||
              animationController.status == AnimationStatus.completed) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
      ),
    );
  }
}
