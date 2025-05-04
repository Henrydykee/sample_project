// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dashboard_data_model.dart';

class DashboardDataMapper extends ClassMapperBase<DashboardData> {
  DashboardDataMapper._();

  static DashboardDataMapper? _instance;
  static DashboardDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DashboardDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DashboardData';

  static String? _$total_grant_amount(DashboardData v) => v.total_grant_amount;
  static const Field<DashboardData, String> _f$total_grant_amount =
      Field('total_grant_amount', _$total_grant_amount, opt: true);
  static int? _$count(DashboardData v) => v.count;
  static const Field<DashboardData, int> _f$count =
      Field('count', _$count, opt: true);
  static int? _$due_in_thirty_day(DashboardData v) => v.due_in_thirty_day;
  static const Field<DashboardData, int> _f$due_in_thirty_day =
      Field('due_in_thirty_day', _$due_in_thirty_day, opt: true);
  static int? _$high_eligibility_count(DashboardData v) =>
      v.high_eligibility_count;
  static const Field<DashboardData, int> _f$high_eligibility_count =
      Field('high_eligibility_count', _$high_eligibility_count, opt: true);

  @override
  final MappableFields<DashboardData> fields = const {
    #total_grant_amount: _f$total_grant_amount,
    #count: _f$count,
    #due_in_thirty_day: _f$due_in_thirty_day,
    #high_eligibility_count: _f$high_eligibility_count,
  };

  static DashboardData _instantiate(DecodingData data) {
    return DashboardData(
        total_grant_amount: data.dec(_f$total_grant_amount),
        count: data.dec(_f$count),
        due_in_thirty_day: data.dec(_f$due_in_thirty_day),
        high_eligibility_count: data.dec(_f$high_eligibility_count));
  }

  @override
  final Function instantiate = _instantiate;

  static DashboardData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DashboardData>(map);
  }

  static DashboardData fromJson(String json) {
    return ensureInitialized().decodeJson<DashboardData>(json);
  }
}

mixin DashboardDataMappable {
  String toJson() {
    return DashboardDataMapper.ensureInitialized()
        .encodeJson<DashboardData>(this as DashboardData);
  }

  Map<String, dynamic> toMap() {
    return DashboardDataMapper.ensureInitialized()
        .encodeMap<DashboardData>(this as DashboardData);
  }

  DashboardDataCopyWith<DashboardData, DashboardData, DashboardData>
      get copyWith => _DashboardDataCopyWithImpl<DashboardData, DashboardData>(
          this as DashboardData, $identity, $identity);
  @override
  String toString() {
    return DashboardDataMapper.ensureInitialized()
        .stringifyValue(this as DashboardData);
  }

  @override
  bool operator ==(Object other) {
    return DashboardDataMapper.ensureInitialized()
        .equalsValue(this as DashboardData, other);
  }

  @override
  int get hashCode {
    return DashboardDataMapper.ensureInitialized()
        .hashValue(this as DashboardData);
  }
}

extension DashboardDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DashboardData, $Out> {
  DashboardDataCopyWith<$R, DashboardData, $Out> get $asDashboardData =>
      $base.as((v, t, t2) => _DashboardDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DashboardDataCopyWith<$R, $In extends DashboardData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? total_grant_amount,
      int? count,
      int? due_in_thirty_day,
      int? high_eligibility_count});
  DashboardDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DashboardDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DashboardData, $Out>
    implements DashboardDataCopyWith<$R, DashboardData, $Out> {
  _DashboardDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DashboardData> $mapper =
      DashboardDataMapper.ensureInitialized();
  @override
  $R call(
          {Object? total_grant_amount = $none,
          Object? count = $none,
          Object? due_in_thirty_day = $none,
          Object? high_eligibility_count = $none}) =>
      $apply(FieldCopyWithData({
        if (total_grant_amount != $none)
          #total_grant_amount: total_grant_amount,
        if (count != $none) #count: count,
        if (due_in_thirty_day != $none) #due_in_thirty_day: due_in_thirty_day,
        if (high_eligibility_count != $none)
          #high_eligibility_count: high_eligibility_count
      }));
  @override
  DashboardData $make(CopyWithData data) => DashboardData(
      total_grant_amount:
          data.get(#total_grant_amount, or: $value.total_grant_amount),
      count: data.get(#count, or: $value.count),
      due_in_thirty_day:
          data.get(#due_in_thirty_day, or: $value.due_in_thirty_day),
      high_eligibility_count:
          data.get(#high_eligibility_count, or: $value.high_eligibility_count));

  @override
  DashboardDataCopyWith<$R2, DashboardData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DashboardDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
