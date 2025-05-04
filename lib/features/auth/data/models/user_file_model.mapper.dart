// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_file_model.dart';

class UserFileModelMapper extends ClassMapperBase<UserFileModel> {
  UserFileModelMapper._();

  static UserFileModelMapper? _instance;
  static UserFileModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserFileModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserFileModel';

  static int _$id(UserFileModel v) => v.id;
  static const Field<UserFileModel, int> _f$id = Field('id', _$id);
  static int _$user_id(UserFileModel v) => v.user_id;
  static const Field<UserFileModel, int> _f$user_id =
      Field('user_id', _$user_id);
  static String _$file_path(UserFileModel v) => v.file_path;
  static const Field<UserFileModel, String> _f$file_path =
      Field('file_path', _$file_path);

  @override
  final MappableFields<UserFileModel> fields = const {
    #id: _f$id,
    #user_id: _f$user_id,
    #file_path: _f$file_path,
  };

  static UserFileModel _instantiate(DecodingData data) {
    return UserFileModel(
        id: data.dec(_f$id),
        user_id: data.dec(_f$user_id),
        file_path: data.dec(_f$file_path));
  }

  @override
  final Function instantiate = _instantiate;

  static UserFileModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserFileModel>(map);
  }

  static UserFileModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserFileModel>(json);
  }
}

mixin UserFileModelMappable {
  String toJson() {
    return UserFileModelMapper.ensureInitialized()
        .encodeJson<UserFileModel>(this as UserFileModel);
  }

  Map<String, dynamic> toMap() {
    return UserFileModelMapper.ensureInitialized()
        .encodeMap<UserFileModel>(this as UserFileModel);
  }

  UserFileModelCopyWith<UserFileModel, UserFileModel, UserFileModel>
      get copyWith => _UserFileModelCopyWithImpl<UserFileModel, UserFileModel>(
          this as UserFileModel, $identity, $identity);
  @override
  String toString() {
    return UserFileModelMapper.ensureInitialized()
        .stringifyValue(this as UserFileModel);
  }

  @override
  bool operator ==(Object other) {
    return UserFileModelMapper.ensureInitialized()
        .equalsValue(this as UserFileModel, other);
  }

  @override
  int get hashCode {
    return UserFileModelMapper.ensureInitialized()
        .hashValue(this as UserFileModel);
  }
}

extension UserFileModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserFileModel, $Out> {
  UserFileModelCopyWith<$R, UserFileModel, $Out> get $asUserFileModel =>
      $base.as((v, t, t2) => _UserFileModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserFileModelCopyWith<$R, $In extends UserFileModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? user_id, String? file_path});
  UserFileModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserFileModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserFileModel, $Out>
    implements UserFileModelCopyWith<$R, UserFileModel, $Out> {
  _UserFileModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserFileModel> $mapper =
      UserFileModelMapper.ensureInitialized();
  @override
  $R call({int? id, int? user_id, String? file_path}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (user_id != null) #user_id: user_id,
        if (file_path != null) #file_path: file_path
      }));
  @override
  UserFileModel $make(CopyWithData data) => UserFileModel(
      id: data.get(#id, or: $value.id),
      user_id: data.get(#user_id, or: $value.user_id),
      file_path: data.get(#file_path, or: $value.file_path));

  @override
  UserFileModelCopyWith<$R2, UserFileModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserFileModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
