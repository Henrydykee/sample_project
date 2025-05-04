


import 'package:dartz/dartz.dart';
import 'package:new_project/features/auth/data/models/user_model.dart';
import 'package:new_project/features/auth/domain/repositotries%20/auth_repositories.dart';

import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';

class Login implements UseCase<UserModel, LoginParams> {
  final AuthenticationRepository _repo;

  Login(this._repo);
  @override
  Future<Either<UIError, UserModel>> call([params]) async {
    try {
      final user = await _repo.loginUser(params!.email,   params.password);
      return Right(user);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}


class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}