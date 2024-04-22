import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/theme/dimens.dart';
import 'package:personal_portfolio/core/utils/get_primary_color.dart';
import 'package:personal_portfolio/core/widgets/app_space.dart';

class StatsItem extends StatelessWidget {
  const StatsItem({
    super.key,
    required this.title,
    required this.stat,
    required this.icon,
  });

  final String title;
  final String stat;
  final IconData icon;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: getPrimaryColor(context),
        ),
        const AppVSpace(),
        Text(
          stat,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: getPrimaryColor(context),
            fontSize: 30,
          ),
        ),
        const AppVSpace(
          space: Dimens.padding,
        ),
        Text(
          title,
        ),
      ],
    );
  }
}
