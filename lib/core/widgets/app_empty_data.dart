import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/core/localization/i18n/translations.g.dart';

class AppEmptyData extends StatelessWidget {
  const AppEmptyData({super.key});


  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Text(t.emptyData),
    );
  }
}
