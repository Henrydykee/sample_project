// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_model.dart';

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
      UserFileModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static int _$id(UserModel v) => v.id;
  static const Field<UserModel, int> _f$id = Field('id', _$id);
  static String _$first_name(UserModel v) => v.first_name;
  static const Field<UserModel, String> _f$first_name =
      Field('first_name', _$first_name);
  static String _$last_name(UserModel v) => v.last_name;
  static const Field<UserModel, String> _f$last_name =
      Field('last_name', _$last_name);
  static String _$email(UserModel v) => v.email;
  static const Field<UserModel, String> _f$email = Field('email', _$email);
  static String _$phone(UserModel v) => v.phone;
  static const Field<UserModel, String> _f$phone = Field('phone', _$phone);
  static int _$active(UserModel v) => v.active;
  static const Field<UserModel, int> _f$active = Field('active', _$active);
  static int _$charge_id(UserModel v) => v.charge_id;
  static const Field<UserModel, int> _f$charge_id =
      Field('charge_id', _$charge_id);
  static int _$premium(UserModel v) => v.premium;
  static const Field<UserModel, int> _f$premium = Field('premium', _$premium);
  static DateTime? _$email_verified_at(UserModel v) => v.email_verified_at;
  static const Field<UserModel, DateTime> _f$email_verified_at =
      Field('email_verified_at', _$email_verified_at, opt: true);
  static DateTime _$created_at(UserModel v) => v.created_at;
  static const Field<UserModel, DateTime> _f$created_at =
      Field('created_at', _$created_at);
  static DateTime _$updated_at(UserModel v) => v.updated_at;
  static const Field<UserModel, DateTime> _f$updated_at =
      Field('updated_at', _$updated_at);
  static List<int>? _$grant_recommendations(UserModel v) =>
      v.grant_recommendations;
  static const Field<UserModel, List<int>> _f$grant_recommendations =
      Field('grant_recommendations', _$grant_recommendations, opt: true);
  static DateTime? _$recommendations_updated_at(UserModel v) =>
      v.recommendations_updated_at;
  static const Field<UserModel, DateTime> _f$recommendations_updated_at = Field(
      'recommendations_updated_at', _$recommendations_updated_at,
      opt: true);
  static DateTime? _$deleted_at(UserModel v) => v.deleted_at;
  static const Field<UserModel, DateTime> _f$deleted_at =
      Field('deleted_at', _$deleted_at, opt: true);
  static UserFileModel? _$file(UserModel v) => v.file;
  static const Field<UserModel, UserFileModel> _f$file =
      Field('file', _$file, opt: true);
  static int _$downgraded(UserModel v) => v.downgraded;
  static const Field<UserModel, int> _f$downgraded =
      Field('downgraded', _$downgraded);
  static String _$fullname(UserModel v) => v.fullname;
  static const Field<UserModel, String> _f$fullname =
      Field('fullname', _$fullname);

  @override
  final MappableFields<UserModel> fields = const {
    #id: _f$id,
    #first_name: _f$first_name,
    #last_name: _f$last_name,
    #email: _f$email,
    #phone: _f$phone,
    #active: _f$active,
    #charge_id: _f$charge_id,
    #premium: _f$premium,
    #email_verified_at: _f$email_verified_at,
    #created_at: _f$created_at,
    #updated_at: _f$updated_at,
    #grant_recommendations: _f$grant_recommendations,
    #recommendations_updated_at: _f$recommendations_updated_at,
    #deleted_at: _f$deleted_at,
    #file: _f$file,
    #downgraded: _f$downgraded,
    #fullname: _f$fullname,
  };

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        id: data.dec(_f$id),
        first_name: data.dec(_f$first_name),
        last_name: data.dec(_f$last_name),
        email: data.dec(_f$email),
        phone: data.dec(_f$phone),
        active: data.dec(_f$active),
        charge_id: data.dec(_f$charge_id),
        premium: data.dec(_f$premium),
        email_verified_at: data.dec(_f$email_verified_at),
        created_at: data.dec(_f$created_at),
        updated_at: data.dec(_f$updated_at),
        grant_recommendations: data.dec(_f$grant_recommendations),
        recommendations_updated_at: data.dec(_f$recommendations_updated_at),
        deleted_at: data.dec(_f$deleted_at),
        file: data.dec(_f$file),
        downgraded: data.dec(_f$downgraded),
        fullname: data.dec(_f$fullname));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl<UserModel, UserModel>(
          this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return UserModelMapper.ensureInitialized()
        .equalsValue(this as UserModel, other);
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>?
      get grant_recommendations;
  UserFileModelCopyWith<$R, UserFileModel, UserFileModel>? get file;
  $R call(
      {int? id,
      String? first_name,
      String? last_name,
      String? email,
      String? phone,
      int? active,
      int? charge_id,
      int? premium,
      DateTime? email_verified_at,
      DateTime? created_at,
      DateTime? updated_at,
      List<int>? grant_recommendations,
      DateTime? recommendations_updated_at,
      DateTime? deleted_at,
      UserFileModel? file,
      int? downgraded,
      String? fullname});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>?
      get grant_recommendations => $value.grant_recommendations != null
          ? ListCopyWith(
              $value.grant_recommendations!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(grant_recommendations: v))
          : null;
  @override
  UserFileModelCopyWith<$R, UserFileModel, UserFileModel>? get file =>
      $value.file?.copyWith.$chain((v) => call(file: v));
  @override
  $R call(
          {int? id,
          String? first_name,
          String? last_name,
          String? email,
          String? phone,
          int? active,
          int? charge_id,
          int? premium,
          Object? email_verified_at = $none,
          DateTime? created_at,
          DateTime? updated_at,
          Object? grant_recommendations = $none,
          Object? recommendations_updated_at = $none,
          Object? deleted_at = $none,
          Object? file = $none,
          int? downgraded,
          String? fullname}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (first_name != null) #first_name: first_name,
        if (last_name != null) #last_name: last_name,
        if (email != null) #email: email,
        if (phone != null) #phone: phone,
        if (active != null) #active: active,
        if (charge_id != null) #charge_id: charge_id,
        if (premium != null) #premium: premium,
        if (email_verified_at != $none) #email_verified_at: email_verified_at,
        if (created_at != null) #created_at: created_at,
        if (updated_at != null) #updated_at: updated_at,
        if (grant_recommendations != $none)
          #grant_recommendations: grant_recommendations,
        if (recommendations_updated_at != $none)
          #recommendations_updated_at: recommendations_updated_at,
        if (deleted_at != $none) #deleted_at: deleted_at,
        if (file != $none) #file: file,
        if (downgraded != null) #downgraded: downgraded,
        if (fullname != null) #fullname: fullname
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      id: data.get(#id, or: $value.id),
      first_name: data.get(#first_name, or: $value.first_name),
      last_name: data.get(#last_name, or: $value.last_name),
      email: data.get(#email, or: $value.email),
      phone: data.get(#phone, or: $value.phone),
      active: data.get(#active, or: $value.active),
      charge_id: data.get(#charge_id, or: $value.charge_id),
      premium: data.get(#premium, or: $value.premium),
      email_verified_at:
          data.get(#email_verified_at, or: $value.email_verified_at),
      created_at: data.get(#created_at, or: $value.created_at),
      updated_at: data.get(#updated_at, or: $value.updated_at),
      grant_recommendations:
          data.get(#grant_recommendations, or: $value.grant_recommendations),
      recommendations_updated_at: data.get(#recommendations_updated_at,
          or: $value.recommendations_updated_at),
      deleted_at: data.get(#deleted_at, or: $value.deleted_at),
      file: data.get(#file, or: $value.file),
      downgraded: data.get(#downgraded, or: $value.downgraded),
      fullname: data.get(#fullname, or: $value.fullname));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
