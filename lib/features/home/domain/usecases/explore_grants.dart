
import 'package:dartz/dartz.dart';

import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';
import '../../data/models/grant_model.dart';
import '../repositories/grant_repositories.dart';

class ExploreGrants implements UseCase<List<GrantModel>, NoParams> {
  final GrantRepository _repo;

  ExploreGrants(this._repo);
  @override
  Future<Either<UIError, List<GrantModel>>> call([params]) async {
    try {
      final data = await _repo.exploreGrants();
      return Right(data!);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}