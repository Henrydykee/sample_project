



import 'package:dartz/dartz.dart';

import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';
import '../repositories/grant_repositories.dart';

class LikeGrant implements UseCase<String, LikeGrantParams> {
  final GrantRepository _repo;

  LikeGrant(this._repo);
  @override
  Future<Either<UIError, String>> call([params]) async {
    try {
      final data = await _repo.likeGrant(params!.id, params.action);
      return Right(data!);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}

class LikeGrantParams{
  final String id;
  final String action;
  LikeGrantParams({required this.id, required this.action});

}