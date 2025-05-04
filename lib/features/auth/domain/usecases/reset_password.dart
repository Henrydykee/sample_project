import 'package:dartz/dartz.dart';
import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';
import '../repositotries /auth_repositories.dart';

class ResetPassword implements UseCase<String, ResetPasswordParams> {
  final AuthenticationRepository _repo;

  ResetPassword(this._repo);
  @override
  Future<Either<UIError, String>> call([params]) async {
    try {
      final user = await _repo.resetPassword( email: params!.email, password: params.password, token: params.token);
      return Right(user);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}

class ResetPasswordParams{
   String email;
   String password;
   String token;


   ResetPasswordParams({required this.email, required this.password, required this.token});


}