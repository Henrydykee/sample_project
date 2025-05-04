import 'dart:developer';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:new_project/core/data/network/network_service_response.dart';
import 'package:new_project/features/home/data/datasource/endpoints.dart';
import 'package:new_project/features/home/data/models/grant_model.dart';

import '../../../../core/data/datasources/remote_datasource_base.dart';
import '../../../../core/data/models/response_model.dart';
import '../../../../core/data/network/network_service.dart';
import '../models/home_data_model.dart';

abstract class GrantRemoteDataSource extends RemoteDataSource {
  Future<HomeDataModel?> getDashboardData();
  Future<List<GrantModel>?> exploreGrants();
  Future<List<GrantModel>?> getSavedGrants();
  Future<GrantModel?> getGrantDetail(String id);
  Future<String?> likeGrant(String id, String action);
  Future<GrantModel?> searchGrants();
}

class GrantRemoteDataSourceImpl implements GrantRemoteDataSource {
  final NetworkService _networkService;
  GrantRemoteDataSourceImpl(this._networkService);

  @override
  void dispose() {}

  @override
  Future<List<GrantModel>?> exploreGrants() async {
    try {
      NetworkServiceResponse response = await _networkService.get(GrantEndpoints.getSavedGrants);
      final data = handleNetworkResponse(response);
      if (data == null || data["grants"] ) {
        return null;
      }
      final grantListData = data["saved_grant"]["data"] as List<dynamic>;
      List<GrantModel> listGrant = grantListData.map((json) => MapperContainer.globals.fromMap<GrantModel>(json)).toList();
      return listGrant;
    } catch (e) {
      print('Error fetching saved grants: $e');
      return null;
    }
  }

  @override
  Future<HomeDataModel?> getDashboardData() async {
    NetworkServiceResponse response = await _networkService.get(GrantEndpoints.getDashboardData);
    final data = handleNetworkResponse(response);
    try {
      final homeData = MapperContainer.globals.fromMap<HomeDataModel>(data['data']);
      log(homeData.toString());
      return ResponseModel<HomeDataModel>(
          message: data["message"],
          status: data["statusCode"],
          data: homeData
      ).data;
    } catch (e) {
      print("Error decoding data: $e");
      return null;
    }
  }


  @override
  Future<GrantModel?> getGrantDetail(String id) async {
    NetworkServiceResponse response = await _networkService.get(GrantEndpoints.getGrantDetail(id));
    final data = handleNetworkResponse(response);
    final grant = MapperContainer.globals.fromMap<GrantModel>(data["grants"]);
    return ResponseModel<GrantModel>(message: data["message"], status: data["statusCode"], data: grant).data;
  }

  @override
  Future<List<GrantModel>?> getSavedGrants() async {
    try {
      NetworkServiceResponse response = await _networkService.get(GrantEndpoints.getSavedGrants);
      final data = handleNetworkResponse(response);
      if (data == null || data["saved_grant"] == null || data["saved_grant"]["data"] == null) {
        return null;
      }
      final grantListData = data["saved_grant"]["data"] as List<dynamic>;
      List<GrantModel> listGrant = grantListData.map((json) => MapperContainer.globals.fromMap<GrantModel>(json)).toList();
      return listGrant;
    } catch (e) {
      print('Error fetching saved grants: $e');
      return null;
    }
  }

  @override
  Future<String> likeGrant(String id, String action) async {
    NetworkServiceResponse response = await _networkService.post(GrantEndpoints.likeGrant(id, action));
    final data = handleNetworkResponse(response);
    return data["message"];
  }

  @override
  Future<GrantModel> searchGrants() {
    // TODO: implement searchGrants
    throw UnimplementedError();
  }
}
