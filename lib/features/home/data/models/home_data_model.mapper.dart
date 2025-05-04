// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'home_data_model.dart';

class HomeDataModelMapper extends ClassMapperBase<HomeDataModel> {
  HomeDataModelMapper._();

  static HomeDataModelMapper? _instance;
  static HomeDataModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeDataModelMapper._());
      GrantModelMapper.ensureInitialized();
      DashboardDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HomeDataModel';

  static List<GrantModel>? _$grants(HomeDataModel v) => v.grants;
  static const Field<HomeDataModel, List<GrantModel>> _f$grants =
      Field('grants', _$grants, opt: true);
  static DashboardData? _$data(HomeDataModel v) => v.data;
  static const Field<HomeDataModel, DashboardData> _f$data =
      Field('data', _$data, opt: true);

  @override
  final MappableFields<HomeDataModel> fields = const {
    #grants: _f$grants,
    #data: _f$data,
  };

  static HomeDataModel _instantiate(DecodingData data) {
    return HomeDataModel(grants: data.dec(_f$grants), data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static HomeDataModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeDataModel>(map);
  }

  static HomeDataModel fromJson(String json) {
    return ensureInitialized().decodeJson<HomeDataModel>(json);
  }
}

mixin HomeDataModelMappable {
  String toJson() {
    return HomeDataModelMapper.ensureInitialized()
        .encodeJson<HomeDataModel>(this as HomeDataModel);
  }

  Map<String, dynamic> toMap() {
    return HomeDataModelMapper.ensureInitialized()
        .encodeMap<HomeDataModel>(this as HomeDataModel);
  }

  HomeDataModelCopyWith<HomeDataModel, HomeDataModel, HomeDataModel>
      get copyWith => _HomeDataModelCopyWithImpl<HomeDataModel, HomeDataModel>(
          this as HomeDataModel, $identity, $identity);
  @override
  String toString() {
    return HomeDataModelMapper.ensureInitialized()
        .stringifyValue(this as HomeDataModel);
  }

  @override
  bool operator ==(Object other) {
    return HomeDataModelMapper.ensureInitialized()
        .equalsValue(this as HomeDataModel, other);
  }

  @override
  int get hashCode {
    return HomeDataModelMapper.ensureInitialized()
        .hashValue(this as HomeDataModel);
  }
}

extension HomeDataModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomeDataModel, $Out> {
  HomeDataModelCopyWith<$R, HomeDataModel, $Out> get $asHomeDataModel =>
      $base.as((v, t, t2) => _HomeDataModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HomeDataModelCopyWith<$R, $In extends HomeDataModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, GrantModel, GrantModelCopyWith<$R, GrantModel, GrantModel>>?
      get grants;
  DashboardDataCopyWith<$R, DashboardData, DashboardData>? get data;
  $R call({List<GrantModel>? grants, DashboardData? data});
  HomeDataModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HomeDataModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeDataModel, $Out>
    implements HomeDataModelCopyWith<$R, HomeDataModel, $Out> {
  _HomeDataModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeDataModel> $mapper =
      HomeDataModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, GrantModel, GrantModelCopyWith<$R, GrantModel, GrantModel>>?
      get grants => $value.grants != null
          ? ListCopyWith($value.grants!, (v, t) => v.copyWith.$chain(t),
              (v) => call(grants: v))
          : null;
  @override
  DashboardDataCopyWith<$R, DashboardData, DashboardData>? get data =>
      $value.data?.copyWith.$chain((v) => call(data: v));
  @override
  $R call({Object? grants = $none, Object? data = $none}) =>
      $apply(FieldCopyWithData({
        if (grants != $none) #grants: grants,
        if (data != $none) #data: data
      }));
  @override
  HomeDataModel $make(CopyWithData data) => HomeDataModel(
      grants: data.get(#grants, or: $value.grants),
      data: data.get(#data, or: $value.data));

  @override
  HomeDataModelCopyWith<$R2, HomeDataModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HomeDataModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
