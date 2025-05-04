import 'dart:developer';
import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/core/data/network/network_service_response.dart';
import 'package:new_project/core/platform/storage/secured_storage.dart';
import 'package:new_project/features/auth/data/models/create_organisation.dart';
import 'package:new_project/features/auth/data/models/register_user.dart';
import '../../../../core/data/datasources/remote_datasource_base.dart';
import '../../../../core/data/models/response_model.dart';
import '../../../../core/data/network/network_service.dart';
import '../../../../core/di/di_config.dart';
import '../../../../core/platform/string_constants.dart';
import '../models/user_model.dart';
import 'endpoints.dart';

abstract class AuthenticationRemoteDataSource extends RemoteDataSource {
  Future<UserModel?> loginUser({required String email, required String password});
  Future<String> registerUser(RegisterUserParams registerUser);
  Future<String> createOrganization(CreateOrganizationParams createOrganizationParams);
  Future<String> requestPasswordRest(String email);
  Future<String> resetPassword({required String email, required String password, required String token});
  Future<UserModel?> updateUser({required String firstName, required String lastName, required String phone, required String email});
  Future<String> updateProfileImage({required XFile image});
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  final NetworkService _networkService;
  AuthenticationRemoteDataSourceImpl(this._networkService);

  @override
  void dispose() {}

  @override
  Future<UserModel?> loginUser({required String email, required String password}) async {
    try {
      NetworkServiceResponse response = await _networkService.post(AuthenticationEndpoints.loginUser, body: {"email": email, "password": password});

      final data = handleNetworkResponse(response);
      final token = data["token"];
      await inject<SecuredStorage>().add(key: SecureStorageStrings.TOKEN, value: token);
      final user = MapperContainer.globals.fromMap<UserModel>(data["user"]);
      return ResponseModel<UserModel>(message: data["message"], status: data["statusCode"], data: user).data;
    } catch (e, stackTrace) {
      return null;
    }
  }

  @override
  Future<String> registerUser(RegisterUserParams registerUser) async {
    NetworkServiceResponse response = await _networkService.post(AuthenticationEndpoints.registerUser, body: {
      "first_name": registerUser.firstName,
      "last_name": registerUser.lastName,
      "email": registerUser.email,
      "phone": registerUser.phone,
      "password": registerUser.password,
      "password_confirmation": registerUser.password
    });
    final data = handleNetworkResponse(response);
    final token = data["token"];
    await inject<SecuredStorage>().add(key: SecureStorageStrings.TOKEN, value: token);
    return data["message"];
  }

  @override
  Future<String> createOrganization(CreateOrganizationParams createOrganizationParams) async {
    NetworkServiceResponse response = await _networkService.post(AuthenticationEndpoints.createOrg, body: {
      "org_name": createOrganizationParams.orgName,
      "org_website": createOrganizationParams.orgWebsite,
      "country_operation": createOrganizationParams.countryOperation,
      "business_type": createOrganizationParams.businessType,
      "business_incorporate": createOrganizationParams.businessIncorporate,
      "business_goal": createOrganizationParams.businessGoal,
      "size": createOrganizationParams.size,
      "registered": createOrganizationParams.registered,
      "revenue": createOrganizationParams.revenue,
      "industry": createOrganizationParams.industry,
      "demographic": createOrganizationParams.demographic,
      "grant_funding": createOrganizationParams.grantFunding,
      "debt_funding": createOrganizationParams.debtFunding,
      "equity_funding": createOrganizationParams.equityFunding,
      "payroll": createOrganizationParams.payroll,
      "research": createOrganizationParams.research,
    });
    final data = handleNetworkResponse(response);
    return data["message"];
  }

  @override
  Future<String> requestPasswordRest(String email) async {
    NetworkServiceResponse response = await _networkService.post(AuthenticationEndpoints.requestPasswordReset, body: {"email": email});
    final data = handleNetworkResponse(response);
    return data["message"];
  }

  @override
  Future<String> resetPassword({required String email, required String password, required String token}) async {
    NetworkServiceResponse response =
        await _networkService.post(AuthenticationEndpoints.resetPassword, body: {"email": email, "password": password, "token": token, "password_confirmation": password});
    final data = handleNetworkResponse(response);
    return data["message"];
  }

  @override
  Future<String> updateProfileImage({required XFile image}) async {
    NetworkServiceResponse response = await _networkService.postMultipart(
      AuthenticationEndpoints.updateProfileImage,
      file: image,
      fileFieldName: "image",
    );
    print(response.data.toString());
    final data = handleNetworkResponse(response);
    return data["message"];
  }

  @override
  Future<UserModel?> updateUser({required String firstName, required String lastName, required String phone, required String email}) async {
    NetworkServiceResponse response = await _networkService.post(AuthenticationEndpoints.updateUser, body: {"fn": firstName, "ln": lastName, "phn": phone, "email": email});
    final data = handleNetworkResponse(response);
    final user = MapperContainer.globals.fromMap<UserModel>(data["data"]["user"]);
    return ResponseModel<UserModel>(message: data["message"], status: data["statusCode"], data: user).data;
  }
}
