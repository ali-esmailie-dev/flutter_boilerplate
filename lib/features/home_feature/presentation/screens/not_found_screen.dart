import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/localization/i18n/translations.g.dart';
import 'package:flutter_boilerplate/core/theme/dimens.dart';
import 'package:flutter_boilerplate/core/widgets/app_scaffold.dart';
import 'package:flutter_boilerplate/core/widgets/app_space.dart';
import 'package:flutter_boilerplate/core/widgets/lottie_viewer.dart';
import 'package:flutter_boilerplate/core/widgets/typography/app_title_large_text.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      smallBody: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LottieViewer(
              path: 'assets/animations/not-found.json',
              width: 200.0,
              height: 200.0,
            ),
            const AppVSpace(space: Dimens.largePadding),
            AppTitleLargeText(t.notFound),
          ],
        ),
      ),
    );
  }
}
