import 'package:dartz/dartz.dart';
import 'package:new_project/features/auth/data/models/register_user.dart';

import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';
import '../repositotries /auth_repositories.dart';

class RegisterUser implements UseCase<String, RegisterUserParams> {
  final AuthenticationRepository _repo;

  RegisterUser(this._repo);
  @override
  Future<Either<UIError, String>> call([params]) async {
    try {
      final user = await _repo.registerUser(params!);
      return Right(user);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}
