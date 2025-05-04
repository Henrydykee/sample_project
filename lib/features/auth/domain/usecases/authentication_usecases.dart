

import 'package:new_project/features/auth/domain/usecases/register_user.dart';
import 'package:new_project/features/auth/domain/usecases/request_paswordreset.dart';
import 'package:new_project/features/auth/domain/usecases/reset_password.dart';
import 'package:new_project/features/auth/domain/usecases/update_profile_image.dart';
import 'package:new_project/features/auth/domain/usecases/update_user.dart';
import 'create_organisation.dart';
import 'login.dart';

class  AuthenticationUsecases {
  Login login;
  RegisterUser registerUser;
  CreateOrganisation createOrganisation;
  RequestPasswordReset requestPasswordReset;
  ResetPassword resetPassword;
  UpdateUser updateUser;
  UpdateProfileImage updateProfileImage;

  AuthenticationUsecases(
      this.login,
      this.registerUser,
      this.createOrganisation,
      this.requestPasswordReset,
      this.resetPassword,
      this.updateUser,
      this.updateProfileImage
      );
}