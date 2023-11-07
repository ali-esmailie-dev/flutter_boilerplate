import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_boilerplate/core/theme/colors.dart';
import 'package:flutter_boilerplate/core/utils/check_theme_status.dart';

class AppSvgViewer extends StatelessWidget {
  const AppSvgViewer({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.colorFilter,
    this.setDefaultColorStatus = true,
  });

  final String path;
  final double? width;
  final double? height;
  final ui.ColorFilter? colorFilter;
  final bool setDefaultColorStatus;

  @override
  Widget build(final BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width ?? 50,
      height: height ?? 50,
      colorFilter: setDefaultColorStatus
          ? colorFilter ??
              (checkDarkMode(context)
                  ? ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                Theme.of(context).primaryColor,
                      BlendMode.srcIn,
                    ))
          : null,
    );
  }
}
