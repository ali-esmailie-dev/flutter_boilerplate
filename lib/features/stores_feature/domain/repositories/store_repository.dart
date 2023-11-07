import 'package:flutter_boilerplate/core/resources/data_state.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/entities/store_entity.dart';

abstract class StoresRepository {
  Future<DataState<List<StoreEntity>>> fetchMyStoreData();
  Future<DataState<List<StoreEntity>>> fetchNearbyStoresData();
}
