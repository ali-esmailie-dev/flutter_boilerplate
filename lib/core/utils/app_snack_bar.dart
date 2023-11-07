import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app.dart';
import 'package:flutter_boilerplate/core/theme/colors.dart';
import 'package:flutter_boilerplate/core/utils/check_theme_status.dart';
import 'package:flutter_boilerplate/core/widgets/app_space.dart';

enum SnackBarType { success, error, warning, info }

Future<void> showSnackBar(
  final String? message, {
  final int? duration,
  final IconData? icon,
  final SnackBarAction? action,
  final SnackBarType? snackBarType,
}) async {
  final SnackBar snackBar = SnackBar(
    content: Builder(
      builder: (final BuildContext context) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: snackBarType == null
                    ? checkDarkMode(context)
                        ? Theme.of(context).primaryColor
                        : AppColors.white
                    : AppColors.white,
              ),
              const AppHSpace(),
            ],
            Text(
              message.toString(),
              style: TextStyle(
                color: snackBarType == null ? null : AppColors.white,
              ),
            ),
          ],
        );
      },
    ),
    duration: Duration(milliseconds: duration ?? 5000),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: snackBarType == null ? null : AppColors.white,
    action: action,
    backgroundColor: snackBarType == SnackBarType.success
        ? AppColors.green
        : snackBarType == SnackBarType.error
            ? AppColors.red
            : snackBarType == SnackBarType.info
                ? Theme.of(
                    globalScaffoldMessengerKey.currentState!.context,
                  ).primaryColor
                : snackBarType == SnackBarType.warning
                    ? AppColors.orange
                    : null,
  );
  globalScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
