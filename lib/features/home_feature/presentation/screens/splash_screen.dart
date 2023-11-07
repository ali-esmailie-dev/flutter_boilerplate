import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/localization/i18n/translations.g.dart';
import 'package:flutter_boilerplate/core/routes/go_routes_path.dart';
import 'package:flutter_boilerplate/core/theme/dimens.dart';
import 'package:flutter_boilerplate/core/utils/get_app_version.dart';
import 'package:flutter_boilerplate/core/widgets/app_loading.dart';
import 'package:flutter_boilerplate/core/widgets/app_scaffold.dart';
import 'package:flutter_boilerplate/core/widgets/app_space.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      context.pushReplacement(GoRoutesPath.introduction);
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 100,
          ),
          AppVSpace(space: Dimens.largePadding),
          AppLoading(),
        ],
      ),
      bottomSheet: SizedBox(
        height: Dimens.bottomSheetHeight,
        child: Center(
          child: FutureBuilder(
            future: getAppVersion(),
            builder: (
              final BuildContext context,
              final AsyncSnapshot<String> snapshot,
            ) {
              String version = '';
              if (snapshot.hasData) {
                version = snapshot.data ?? '';
              }
              return Text(t.version(version: version));
            },
          ),
        ),
      ),
    );
  }
}
