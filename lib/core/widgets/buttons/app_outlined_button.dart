import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/theme/dimens.dart';
import 'package:flutter_boilerplate/core/widgets/app_space.dart';

class AppOutlinedButton extends StatelessWidget {

  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    this.title,
    this.color,
    this.icon,
    this.verticalMargin = Dimens.padding,
    this.child,
  });
  final String? title;
  final Color? color;
  final GestureTapCallback? onPressed;
  final IconData? icon;
  final double verticalMargin;
  final Widget? child;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 45.0,
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: OutlinedButton(
        onPressed: onPressed,
        child: child ?? Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon == null) const SizedBox.shrink() else Icon(
                    icon,
                    size: 20,
                  ),
            if (icon == null) const SizedBox.shrink() else const AppHSpace(),
            Text(
              title ?? '',
            ),
            if (icon == null) const SizedBox.shrink() else const SizedBox(
                    width: Dimens.padding,
                  ),
          ],
        ),
      ),
    );
  }
}
