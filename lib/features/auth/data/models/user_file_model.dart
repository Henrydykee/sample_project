

import 'package:dart_mappable/dart_mappable.dart';

part 'user_file_model.mapper.dart';

@MappableClass()
class UserFileModel with UserFileModelMappable {
  final int id;
  final int user_id;
  final String file_path;

  const UserFileModel({
    required this.id,
    required this.user_id,
    required this.file_path,
  });
}