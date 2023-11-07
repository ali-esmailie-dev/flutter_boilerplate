import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/routes/apis_routes.dart';
import 'package:flutter_boilerplate/core/utils/general_api.dart';

class StoresApiProvider {
  String apiToken = 'Token cde1d1bdcce3fec54942967313fde9f286f1dfa2';

  Future<Response> getMyStores() async {
    final Response result = await generalApiHandler(
      method: 'get',
      url: Routes.MY_STORES,
      header: {'Authorization': apiToken},
    );
    return result;
  }

  Future<Response> getNearbyStores(
    final double lat,
    final double long, {
    final String? query,
    final int? catId,
    final int? radius,
    final bool? creditStatus,
  }) async {
    const String loc = 'POINT(51.407794654369354 35.702270677444446)';
    final Map<String, dynamic> data = {
      'location': loc,
      'radius': radius ?? (query != null ? 50 : 3),
      'city': 1,
      'v': 3,
    };

    if (query != null) {
      data['query'] = query;
    }
    if (catId != null) {
      data['category'] = catId;
    }
    if (creditStatus != null) {
      data['credit'] = true;
    }

    final Response result = await generalApiHandler(
      method: 'post',
      url: Routes.STORE_AROUND,
      handleNetworkError: true,
      data: data,
    );

    return result;
  }
}
