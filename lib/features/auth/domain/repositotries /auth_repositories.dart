

import 'package:image_picker/image_picker.dart';
import 'package:new_project/features/auth/data/models/user_model.dart';

import '../../data/models/create_organisation.dart';
import '../../data/models/register_user.dart';

abstract class AuthenticationRepository {
  Future<UserModel> loginUser(String email, String password);
  Future<String> registerUser(RegisterUserParams registerUser);
  Future<String> createOrganization(CreateOrganizationParams createOrganizationParams);
  Future<String> resetPassword({required String email, required String password, required String token});
  Future<String> requestPasswordRest(String email);
  Future<String> updateProfileImage({required XFile image});
  Future<UserModel> updateUser({required String firstName, required String lastName, required String phone, required String email});
}