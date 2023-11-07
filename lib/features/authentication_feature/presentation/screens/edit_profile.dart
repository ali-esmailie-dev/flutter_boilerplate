import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:flutter_boilerplate/core/theme/dimens.dart';
import 'package:flutter_boilerplate/core/utils/app_date_formatter.dart';
import 'package:flutter_boilerplate/core/utils/date_time_picker.dart';
import 'package:flutter_boilerplate/core/utils/form_utils/formz_validation_models/validation_error_extensions.dart';
import 'package:flutter_boilerplate/core/utils/get_sheba_bank.dart';
import 'package:flutter_boilerplate/core/utils/sized_context.dart';
import 'package:flutter_boilerplate/core/widgets/app_error_again.dart';
import 'package:flutter_boilerplate/core/widgets/app_loading.dart';
import 'package:flutter_boilerplate/core/widgets/app_scaffold.dart';
import 'package:flutter_boilerplate/core/widgets/app_space.dart';
import 'package:flutter_boilerplate/core/widgets/app_text_form_field.dart';
import 'package:flutter_boilerplate/core/widgets/buttons/app_button.dart';
import 'package:flutter_boilerplate/core/widgets/drop_downs/app_searchable_drop_down.dart';
import 'package:flutter_boilerplate/core/widgets/general_appbar.dart';
import 'package:flutter_boilerplate/core/widgets/lists/app_list_view.dart';
import 'package:flutter_boilerplate/core/widgets/typography/app_text.dart';
import 'package:flutter_boilerplate/features/authentication_feature/data/models/user_model.dart';
import 'package:flutter_boilerplate/features/authentication_feature/presentation/bloc/profile_bloc.dart';
import 'package:flutter_boilerplate/features/authentication_feature/presentation/bloc/profile_status.dart';
import 'package:flutter_boilerplate/features/authentication_feature/presentation/bloc/submit_profile_status.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController birthDateController = TextEditingController();

  @override
  void initState() {
    context.read<ProfileBloc>().add(FetchProfileEvent());
    context.read<ProfileBloc>().add(SetValuesStatusEvent(false));
    super.initState();
  }

  /// TODO ali : translate this page
  @override
  Widget build(final BuildContext context) {
    final List<String> genders = [
      'Male',
      'Female',
    ];
    return AppScaffold(
      appBar: const GeneralAppBar(
        title: 'Edit profile',
      ),
      smallBody: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (final BuildContext context, final ProfileState state) {
          final ProfileBloc read = context.read<ProfileBloc>();
          if (state.profileStatus is ProfileLoading) {
            return const AppLoading();
          }
          if (state.profileStatus is ProfileCompleted) {
            final ProfileCompleted profileCompleted =
                state.profileStatus as ProfileCompleted;

            if (!state.setValuesStatus) {
              final UserModel userModel = profileCompleted.userModel;

              read.add(EditPhoneEvent('+${userModel.phone ?? ''}'));
              read.add(EditNameEvent(userModel.firstName ?? ''));
              read.add(EditLastNameEvent(userModel.lastName ?? ''));
              read.add(EditNationalCodeEvent(userModel.nationalCode ?? ''));

              if (userModel.gender != null) {
                read.add(EditGenderEvent(userModel.gender!));
              }

              if (userModel.birthdate != null) {
                birthDateController = TextEditingController(
                  text: appDateFormatter(
                    context: context,
                    datetime: userModel.birthdate.toString(),
                  ),
                );
              }
              read.add(EditShebaEvent(userModel.shebaNumber ?? ''));
              read.add(SetValuesStatusEvent(true));
            }
            return !state.setValuesStatus
                ? const SizedBox.shrink()
                : AppListView(
                    children: [
                      const AppVSpace(),
                      AbsorbPointer(
                        child: AppTextFormField(
                          initialValue: state.phoneNumber.value,
                          labelText: 'شماره موبایل',
                          maxLength: 11,
                          textInputType: TextInputType.phone,
                          textDirection: TextDirection.ltr,
                          prefixIcon: const Icon(Icons.phone),
                        ),
                      ),
                      const AppVSpace(),
                      AppTextFormField(
                        initialValue: state.name.value,
                        onChanged: (final String value) {
                          read.add(EditNameEvent(value));
                        },
                        labelText: 'نام',
                        maxLength: 50,
                        textInputType: TextInputType.name,
                        prefixIcon: const Icon(Icons.perm_identity_sharp),
                        errorText: state.name.displayError == null
                            ? null
                            : state.name.error?.errorText(),
                      ),
                      const AppVSpace(),
                      AppTextFormField(
                        initialValue: state.lastName.value,
                        onChanged: (final String value) {
                          read.add(EditLastNameEvent(value));
                        },
                        labelText: 'نام خانوادگی',
                        maxLength: 50,
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(Icons.perm_identity_sharp),
                        errorText: state.lastName.displayError == null
                            ? null
                            : state.lastName.error?.errorText(),
                      ),
                      const AppVSpace(),
                      AppTextFormField(
                        initialValue: state.nationalCode.value,
                        onChanged: (final String value) {
                          read.add(EditNationalCodeEvent(value));
                        },
                        labelText: 'کد ملی',
                        maxLength: 11,
                        textInputType: TextInputType.number,
                        prefixIcon: const Icon(Icons.account_box_outlined),
                        errorText: state.nationalCode.displayError == null
                            ? null
                            : state.nationalCode.error?.errorText(),
                      ),
                      const AppVSpace(),
                      Row(
                        children: [
                          AppSearchableDropDown<int>(
                            initialSelection: state.gender,
                            onSelected: (final int? value) {
                              read.add(EditGenderEvent(value!));
                            },
                            items: genders
                                .asMap()
                                .entries
                                .map(
                                  (final MapEntry<int, String> item) =>
                                      DropdownMenuEntry<int>(
                                    value: item.key + 1,
                                    label: item.value,
                                  ),
                                )
                                .toList(),
                            leadingIcon: Icons.group,
                            enableFilter: false,
                            width: context.appMediaQuerySmallSizeWidth * 0.5 -
                                Dimens.largePadding,
                            child: const AppText(
                              'جنسیت',
                            ),
                          ),
                          const AppHSpace(),
                          Expanded(
                            child: GestureDetector(
                              onTap: onBirthDateTap,
                              child: AbsorbPointer(
                                child: AppTextFormField(
                                  controller: birthDateController,
                                  labelText: 'تاریخ تولد',
                                  prefixIcon: const Icon(
                                    Icons.calendar_today_outlined,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const AppVSpace(),
                      AppTextFormField(
                        initialValue: state.email.value,
                        onChanged: (final String value) {
                          read.add(EditEmailEvent(value));
                        },
                        labelText: 'ایمیل',
                        prefixIcon: const Icon(Icons.mail_outline),
                        textDirection: TextDirection.ltr,
                        errorText: state.email.displayError == null
                            ? null
                            : state.email.error?.errorText(),
                      ),
                      const AppVSpace(),
                      AppTextFormField(
                        initialValue: state.shebaNumber.value,
                        onChanged: (final String value) {
                          read.add(EditShebaEvent(value));
                        },
                        labelText: 'شماره شبا',
                        prefixIcon: const Icon(Icons.credit_card_outlined),
                        suffixText: 'IR',
                        textDirection: TextDirection.ltr,
                        textInputType: TextInputType.number,
                        errorText: state.shebaNumber.displayError == null
                            ? null
                            : state.shebaNumber.error?.errorText(),
                      ),
                      if (state.shebaNumber.displayError == null) ...[
                        const AppVSpace(
                          space: Dimens.padding,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.padding,
                          ),
                          child: AppText(
                            getShebaBank(
                              context: context,
                              shebaNumber: state.shebaNumber.value,
                            ),
                          ),
                        ),
                      ],
                      const AppVSpace(),
                      if (state.submitProfileStatus is SubmitProfileLoading)
                        const AppLoading()
                      else
                        AppButton(
                          title: 'ثبت',
                          onPressed: () {
                            read.add(SubmitEvent());
                          },
                        ),
                      const AppVSpace(),
                    ],
                  );
          }

          if (state.profileStatus is ProfileError) {
            final ProfileError profileError =
                state.profileStatus as ProfileError;
            return AppErrorAgain(
              errorMessage: profileError.message,
              onReloadButtonTap: () {
                BlocProvider.of<ProfileBloc>(context).add(
                  FetchProfileEvent(),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<void> onBirthDateTap() async {
    final Jalali? date = await pickDate(
      context: context,
      title: 'تاریخ تولد خود را انتخاب کنید:',
    );
    if (date != null) {
      final String birthDate = '${date.year}/${date.month}/${date.day}';
      context.read<ProfileBloc>().add(EditBirthDateEvent(date));
      birthDateController = TextEditingController(
        text: birthDate,
      );
    }
  }
}
