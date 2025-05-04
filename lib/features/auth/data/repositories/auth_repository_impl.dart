import 'package:image_picker/image_picker.dart';
import 'package:new_project/core/managers/local_sorage.dart';
import 'package:new_project/core/utils/data/guarded_datasource_calls.dart';
import 'package:new_project/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:new_project/features/auth/data/models/create_organisation.dart';
import 'package:new_project/features/auth/data/models/register_user.dart';
import 'package:new_project/features/auth/data/models/user_model.dart';
import 'package:new_project/features/auth/domain/repositotries%20/auth_repositories.dart';

import '../../../../core/di/di_config.dart';


class AuthenticationRepositoryImpl implements AuthenticationRepository {

  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepositoryImpl(
      this._remoteDataSource,
      ) {}

  @override
  Future<UserModel> loginUser(String email, String password) async {
    final user = await guardedApiCall<UserModel>(() => _remoteDataSource.loginUser(email: email, password: password));
    if(user != null){
      await inject<LocalStorageService>().setJson("user", user.toMap());
    }
    return user;
  }

  @override
  Future<String> registerUser(RegisterUserParams registerUser) {
    return guardedApiCall<String>(() => _remoteDataSource.registerUser(registerUser));
  }

  @override
  Future<String> createOrganization(CreateOrganizationParams createOrganizationParams) {
    return guardedApiCall<String>(() => _remoteDataSource.createOrganization(createOrganizationParams));
  }

  @override
  Future<String> requestPasswordRest(String email) {
    return guardedApiCall<String>(() => _remoteDataSource.requestPasswordRest(email));
  }

  @override
  Future<String> resetPassword({required String email, required String password, required String token}) {
    return guardedApiCall<String>(() => _remoteDataSource.resetPassword(email: email, password: password, token: token));
  }

  @override
  Future<String> updateProfileImage({required XFile image}) {
    return guardedApiCall<String>(() => _remoteDataSource.updateProfileImage(image: image));
  }

  @override
  Future<UserModel> updateUser({required String firstName, required String lastName, required String phone, required String email}) async {
    final user = await guardedApiCall<UserModel>(() => _remoteDataSource.updateUser(firstName: firstName, lastName: lastName, phone: phone, email: email));
    if(user != null){
    await inject<LocalStorageService>().setJson("user", user.toMap());
    }
    return user;
  }

}
