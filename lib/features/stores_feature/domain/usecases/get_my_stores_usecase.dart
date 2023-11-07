import 'package:flutter_boilerplate/core/resources/data_state.dart';
import 'package:flutter_boilerplate/core/use_case/use_case.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/entities/store_entity.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/repositories/store_repository.dart';

class GetMyStoresUseCase
    extends UseCase<DataState<List<StoreEntity>>, NoParams> {
  GetMyStoresUseCase(this.storesRepository);

  final StoresRepository storesRepository;

  @override
  Future<DataState<List<StoreEntity>>> call(final NoParams params) {
    return storesRepository.fetchMyStoreData();
  }
}
