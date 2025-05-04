

import 'package:dartz/dartz.dart';

import '../../../../core/data/database/db_exceptions.dart';
import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/domain/usercase_typedefs.dart';
import '../../../../core/utils/error_helpers.dart';
import '../../data/models/user_model.dart';
import '../repositotries /auth_repositories.dart';

class UpdateUser implements UseCase<UserModel, UpdateUserParams> {
  final AuthenticationRepository _repo;

  UpdateUser(this._repo);
  @override
  Future<Either<UIError, UserModel>> call([params]) async {
    try {
      final user = await _repo.updateUser(firstName: params!.firstName, lastName: params.lastName, phone: params.phone, email: params.email);
      return Right(user);
    } on NetworkFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    } on CacheFailure catch (e, s) {
      return Left(getUIErrorFromUsecaseFailure(e.message, e, s));
    }
  }
}


class UpdateUserParams {
  final String email;
  final String phone;
  final String firstName;
  final String lastName;


  UpdateUserParams({
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName
  });
}