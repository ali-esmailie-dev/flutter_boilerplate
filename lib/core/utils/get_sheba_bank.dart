import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/core/utils/locale_handler.dart';
import 'package:persian_tools/persian_tools.dart';
import 'package:persian_tools/src/core/sheba/model.dart';

String? getShebaBank({
  final BuildContext? context,
  final String? shebaNumber,
}) {
  String? result;
  try {
    final Sheba sheba = Sheba('IR$shebaNumber');
    final BankInformation? bank = sheba();
    if(context == null){
      return bank?.persianName;
    }
    return checkEnState(context) ? bank?.name : bank?.persianName;
  } catch (e) {
    return result;
  }
}
