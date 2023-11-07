import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/resources/data_state.dart';
import 'package:flutter_boilerplate/core/utils/response_error_handler.dart';
import 'package:flutter_boilerplate/features/stores_feature/data/data_sources/remote/api_provider.dart';
import 'package:flutter_boilerplate/features/stores_feature/data/models/store_model.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/entities/store_entity.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/repositories/store_repository.dart';

class StoresRepositoryImpl extends StoresRepository {
  StoresRepositoryImpl(this.apiProvider);

  StoresApiProvider apiProvider;

  @override
  Future<DataState<List<StoreEntity>>> fetchMyStoreData() async {
    try {
      final Response response = await apiProvider.getMyStores();
      if (response.statusCode == 200) {
        final List<StoreEntity> storeEntities = storeModelListFromJson(
          response.data['data'],
        );
        return DataSuccess(storeEntities);
      } else {
        return DataFailed(responseErrorHandler());
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }

  @override
  Future<DataState<List<StoreEntity>>> fetchNearbyStoresData() async {
    try {
      /// TODO Ali: set nearby stores parameter
      final Response response = await apiProvider.getNearbyStores(0.0, 0.0);
      if (response.statusCode == 200) {
        final List<StoreEntity> storeEntities = storeModelListFromJson(
          response.data['data'],
        );
        return DataSuccess(storeEntities);
      } else {
        return DataFailed(responseErrorHandler());
      }
    } catch (e) {
      return DataFailed(responseErrorHandler(error: e));
    }
  }
}
