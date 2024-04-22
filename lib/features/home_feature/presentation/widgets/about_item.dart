import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/utils/get_primary_color.dart';
import 'package:personal_portfolio/core/utils/locale_handler.dart';
import 'package:personal_portfolio/core/widgets/app_space.dart';

class AboutItem extends StatelessWidget {
  const AboutItem({
    super.key,
    required this.title,
    required this.value,
    this.forceLtrValue = false,
  });

  final String title;
  final String value;
  final bool? forceLtrValue;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.chevron_right,
          size: 24,
          color: getPrimaryColor(context),
        ),
        const AppHSpace(),
        Text(
          '$title:  ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Directionality(
          textDirection: forceLtrValue!
              ? TextDirection.ltr
              : (checkEnState(context) ? TextDirection.ltr : TextDirection.rtl),
          child: Text(
            value,
          ),
        ),
      ],
    );
  }
}
