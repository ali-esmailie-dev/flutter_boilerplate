import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/resources/data_state.dart';
import 'package:flutter_boilerplate/core/use_case/use_case.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/entities/store_entity.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/usecases/get_my_stores_usecase.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/usecases/get_stores_use_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'stores_event.dart';
part 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  StoresBloc(this.getMyStoresUseCase, this.getStoresUseCase)
      : super(StoresState(storesStatus: StoreStatus.initial)) {
    on<FetchMyStoresEvent>(
      (final FetchMyStoresEvent event, final Emitter<StoresState> emit) async {
        emit(state.copyWith(newStoresStatus: StoreStatus.initial));

        final DataState dataState = await getMyStoresUseCase(NoParams());

        if (dataState is DataSuccess) {
          state.refreshController.refreshCompleted();
          emit(
            state.copyWith(
              newStoresStatus: StoreStatus.success,
              storesEntity: dataState.data,
            ),
          );
        }

        if (dataState is DataFailed) {
          state.refreshController.refreshFailed();
          emit(
            state.copyWith(
              newStoresStatus: StoreStatus.failure,
              errorMessage: dataState.error,
            ),
          );
        }
      },
    );

    on<FetchStoresEvent>(
      (final FetchStoresEvent event, final Emitter<StoresState> emit) async {
        emit(state.copyWith(newStoresStatus: StoreStatus.initial));

        final DataState dataState = await getStoresUseCase(null);

        if (dataState is DataSuccess) {
          state.refreshController.refreshCompleted();
          emit(
            state.copyWith(
              newStoresStatus: StoreStatus.success,
              storesEntity: dataState.data,
            ),
          );
        }

        if (dataState is DataFailed) {
          state.refreshController.refreshFailed();
          emit(
            state.copyWith(
              newStoresStatus: StoreStatus.failure,
              errorMessage: dataState.error,
            ),
          );
        }
      },
    );
  }

  final GetMyStoresUseCase getMyStoresUseCase;
  final GetStoresUseCases getStoresUseCase;
}
