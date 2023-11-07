import 'package:flutter_boilerplate/core/utils/form_utils/fields_validator_methods.dart';
import 'package:formz/formz.dart';

enum ShebaNumberValidationError { invalid, empty }

class ShebaNumberInput extends FormzInput<String, ShebaNumberValidationError> {
  const ShebaNumberInput.pure() : super.pure('');

  const ShebaNumberInput.dirty([super.value = '']) : super.dirty();

  @override
  ShebaNumberValidationError? validator(final String? value) {
    return value!.isNotEmpty
        ? FieldsValidatorMethods().validateShebaNumber(value)
            ? null
            : ShebaNumberValidationError.invalid
        : ShebaNumberValidationError.empty;
  }
}