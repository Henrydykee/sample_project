import 'package:dartz/dartz.dart';
import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';
import '../../data/models/home_data_model.dart';
import '../repositories/grant_repositories.dart';

class GetDashboardData implements UseCase<HomeDataModel, NoParams> {
  final GrantRepository _repo;

  GetDashboardData(this._repo);
  @override
  Future<Either<UIError, HomeDataModel>> call([params]) async {
    try {
      final data = await _repo.getDashboardData();
      return Right(data!);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}