import 'package:flutter_boilerplate/core/resources/data_state.dart';
import 'package:flutter_boilerplate/core/use_case/use_case.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/entities/store_entity.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/repositories/store_repository.dart';

class GetStoresUseCases extends UseCase<DataState<List<StoreEntity>>, String> {

  GetStoresUseCases(this.storesRepository);
  StoresRepository storesRepository;

  @override
  Future<DataState<List<StoreEntity>>> call(final String? params) {
    return storesRepository.fetchNearbyStoresData();
  }
}
