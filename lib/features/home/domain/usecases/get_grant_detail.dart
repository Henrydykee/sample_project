



import 'package:dartz/dartz.dart';
import 'package:new_project/features/home/data/models/grant_model.dart';

import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';
import '../repositories/grant_repositories.dart';

class GetGrantDetail implements UseCase<GrantModel, String> {
  final GrantRepository _repo;

  GetGrantDetail(this._repo);
  @override
  Future<Either<UIError, GrantModel>> call([params]) async {
    try {
      final data = await _repo.getGrantDetail(params!);
      return Right(data!);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}