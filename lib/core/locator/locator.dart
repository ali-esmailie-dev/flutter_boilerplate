import 'package:flutter_boilerplate/features/authentication_feature/data/data_sources/remote/api_provider.dart';
import 'package:flutter_boilerplate/features/authentication_feature/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_boilerplate/features/authentication_feature/domain/repositories/authentication_repository.dart';
import 'package:flutter_boilerplate/features/authentication_feature/domain/usecases/use_cases.dart';
import 'package:flutter_boilerplate/features/authentication_feature/presentation/bloc/login_bloc.dart';
import 'package:flutter_boilerplate/features/authentication_feature/presentation/bloc/profile_bloc.dart';
import 'package:flutter_boilerplate/features/authentication_feature/presentation/bloc/verify_otp_bloc.dart';
import 'package:flutter_boilerplate/features/stores_feature/data/data_sources/remote/api_provider.dart';
import 'package:flutter_boilerplate/features/stores_feature/data/repositories/store_repository_impl.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/repositories/store_repository.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/usecases/get_my_stores_usecase.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/usecases/get_stores_use_cases.dart';
import 'package:flutter_boilerplate/features/stores_feature/presentation/bloc/stores_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupStoreLocators() async {
  /// register stores api provider
  locator.registerSingleton<StoresApiProvider>(StoresApiProvider());

  /// register my store repository
  locator.registerSingleton<StoresRepository>(
    StoresRepositoryImpl(
      /// To automatically find from among the previous registrations
      locator(),
    ),
  );

  /// register nearby stores use case
  locator.registerSingleton<GetStoresUseCases>(GetStoresUseCases(locator()));

  /// register my stores use case
  locator.registerSingleton<GetMyStoresUseCase>(GetMyStoresUseCase(locator()));

  /// register bloc
  locator.registerSingleton<StoresBloc>(StoresBloc(locator(), locator()));
}

Future<void> setupAuthenticationLocators() async {
  /// register authentication api provider
  locator.registerSingleton<AuthenticationApiProvider>(
    AuthenticationApiProvider(),
  );

  /// register repositories
  locator.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(locator()),
  );

  /// register login use case
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));

  /// register login bloc factory
  locator.registerFactory<LoginBloc>(() => LoginBloc(locator()));

  /// register verify otp use case
  locator.registerSingleton<VerifyOtpUseCase>(VerifyOtpUseCase(locator()));

  /// register verify otp bloc factory
  locator.registerFactory<VerifyOtpBloc>(() => VerifyOtpBloc(locator()));

  /// register profile use case
  locator.registerSingleton<EditUserProfileUseCase>(
    EditUserProfileUseCase(locator()),
  );
  locator.registerSingleton<GetUserProfileUseCase>(
    GetUserProfileUseCase(locator()),
  );

  /// register login bloc factory
  locator.registerFactory<ProfileBloc>(
    () => ProfileBloc(locator(), locator()),
  );
}
