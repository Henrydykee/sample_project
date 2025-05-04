import 'package:dartz/dartz.dart';
import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';
import '../repositotries /auth_repositories.dart';

class RequestPasswordReset implements UseCase<String, String> {
  final AuthenticationRepository _repo;

  RequestPasswordReset(this._repo);
  @override
  Future<Either<UIError, String>> call([params]) async {
    try {
      final user = await _repo.requestPasswordRest(params!);
      return Right(user);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}