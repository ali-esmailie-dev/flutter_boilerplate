part of 'stores_bloc.dart';

enum StoreStatus { initial, success, failure }

class StoresState {
  StoresState({
    required this.storesStatus,
    this.storesEntity = const <StoreEntity>[],
    this.errorMessage = '',
  });

  StoreStatus storesStatus;
  List<StoreEntity> storesEntity;
  String errorMessage;
  RefreshController refreshController = RefreshController();

  StoresState copyWith({
    final StoreStatus? newStoresStatus,
    final List<StoreEntity>? storesEntity,
    final String? errorMessage,
  }) {
    return StoresState(
      storesStatus: newStoresStatus ?? storesStatus,
      storesEntity: storesEntity ?? this.storesEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
