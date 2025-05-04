
import 'package:dart_mappable/dart_mappable.dart';
import 'package:new_project/features/auth/data/models/user_file_model.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String phone;
  final int active;
  final int charge_id;
  final int premium;
  final DateTime? email_verified_at;
  final DateTime created_at;
  final DateTime updated_at;
  final List<int>? grant_recommendations;
  final DateTime? recommendations_updated_at;
  final DateTime? deleted_at;
  final int downgraded;
  final String fullname;
  final UserFileModel? file;

  const UserModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone,
    required this.active,
    required this.charge_id,
    required this.premium,
    this.email_verified_at,
    required this.created_at,
    required this.updated_at,
    this.grant_recommendations,
    this.recommendations_updated_at,
    this.deleted_at,
    this.file,
    required this.downgraded,
    required this.fullname,
  });
}


