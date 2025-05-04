// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'grant_model.dart';

class GrantModelMapper extends ClassMapperBase<GrantModel> {
  GrantModelMapper._();

  static GrantModelMapper? _instance;
  static GrantModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GrantModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GrantModel';

  static int? _$id(GrantModel v) => v.id;
  static const Field<GrantModel, int> _f$id = Field('id', _$id, opt: true);
  static int? _$status(GrantModel v) => v.status;
  static const Field<GrantModel, int> _f$status =
      Field('status', _$status, opt: true);
  static String? _$name(GrantModel v) => v.name;
  static const Field<GrantModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$location(GrantModel v) => v.location;
  static const Field<GrantModel, String> _f$location =
      Field('location', _$location, opt: true);
  static String? _$type(GrantModel v) => v.type;
  static const Field<GrantModel, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$gender(GrantModel v) => v.gender;
  static const Field<GrantModel, String> _f$gender =
      Field('gender', _$gender, opt: true);
  static String? _$age_range(GrantModel v) => v.age_range;
  static const Field<GrantModel, String> _f$age_range =
      Field('age_range', _$age_range, opt: true);
  static String? _$website(GrantModel v) => v.website;
  static const Field<GrantModel, String> _f$website =
      Field('website', _$website, opt: true);
  static String? _$url(GrantModel v) => v.url;
  static const Field<GrantModel, String> _f$url =
      Field('url', _$url, opt: true);
  static String? _$amount(GrantModel v) => v.amount;
  static const Field<GrantModel, String> _f$amount =
      Field('amount', _$amount, opt: true);
  static String? _$description(GrantModel v) => v.description;
  static const Field<GrantModel, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$requirements(GrantModel v) => v.requirements;
  static const Field<GrantModel, String> _f$requirements =
      Field('requirements', _$requirements, opt: true);
  static String? _$geo_focus(GrantModel v) => v.geo_focus;
  static const Field<GrantModel, String> _f$geo_focus =
      Field('geo_focus', _$geo_focus, opt: true);
  static String? _$founder(GrantModel v) => v.founder;
  static const Field<GrantModel, String> _f$founder =
      Field('founder', _$founder, opt: true);
  static DateTime? _$deadline(GrantModel v) => v.deadline;
  static const Field<GrantModel, DateTime> _f$deadline =
      Field('deadline', _$deadline, opt: true);
  static DateTime? _$created_at(GrantModel v) => v.created_at;
  static const Field<GrantModel, DateTime> _f$created_at =
      Field('created_at', _$created_at, opt: true);
  static DateTime? _$updated_at(GrantModel v) => v.updated_at;
  static const Field<GrantModel, DateTime> _f$updated_at =
      Field('updated_at', _$updated_at, opt: true);
  static String? _$criteria(GrantModel v) => v.criteria;
  static const Field<GrantModel, String> _f$criteria =
      Field('criteria', _$criteria, opt: true);
  static String? _$sector(GrantModel v) => v.sector;
  static const Field<GrantModel, String> _f$sector =
      Field('sector', _$sector, opt: true);
  static String? _$region(GrantModel v) => v.region;
  static const Field<GrantModel, String> _f$region =
      Field('region', _$region, opt: true);
  static double? _$score(GrantModel v) => v.score;
  static const Field<GrantModel, double> _f$score =
      Field('score', _$score, opt: true);
  static String? _$grant_eligibility(GrantModel v) => v.grant_eligibility;
  static const Field<GrantModel, String> _f$grant_eligibility =
      Field('grant_eligibility', _$grant_eligibility, opt: true);
  static double? _$priority_score(GrantModel v) => v.priority_score;
  static const Field<GrantModel, double> _f$priority_score =
      Field('priority_score', _$priority_score, opt: true);

  @override
  final MappableFields<GrantModel> fields = const {
    #id: _f$id,
    #status: _f$status,
    #name: _f$name,
    #location: _f$location,
    #type: _f$type,
    #gender: _f$gender,
    #age_range: _f$age_range,
    #website: _f$website,
    #url: _f$url,
    #amount: _f$amount,
    #description: _f$description,
    #requirements: _f$requirements,
    #geo_focus: _f$geo_focus,
    #founder: _f$founder,
    #deadline: _f$deadline,
    #created_at: _f$created_at,
    #updated_at: _f$updated_at,
    #criteria: _f$criteria,
    #sector: _f$sector,
    #region: _f$region,
    #score: _f$score,
    #grant_eligibility: _f$grant_eligibility,
    #priority_score: _f$priority_score,
  };

  static GrantModel _instantiate(DecodingData data) {
    return GrantModel(
        id: data.dec(_f$id),
        status: data.dec(_f$status),
        name: data.dec(_f$name),
        location: data.dec(_f$location),
        type: data.dec(_f$type),
        gender: data.dec(_f$gender),
        age_range: data.dec(_f$age_range),
        website: data.dec(_f$website),
        url: data.dec(_f$url),
        amount: data.dec(_f$amount),
        description: data.dec(_f$description),
        requirements: data.dec(_f$requirements),
        geo_focus: data.dec(_f$geo_focus),
        founder: data.dec(_f$founder),
        deadline: data.dec(_f$deadline),
        created_at: data.dec(_f$created_at),
        updated_at: data.dec(_f$updated_at),
        criteria: data.dec(_f$criteria),
        sector: data.dec(_f$sector),
        region: data.dec(_f$region),
        score: data.dec(_f$score),
        grant_eligibility: data.dec(_f$grant_eligibility),
        priority_score: data.dec(_f$priority_score));
  }

  @override
  final Function instantiate = _instantiate;

  static GrantModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GrantModel>(map);
  }

  static GrantModel fromJson(String json) {
    return ensureInitialized().decodeJson<GrantModel>(json);
  }
}

mixin GrantModelMappable {
  String toJson() {
    return GrantModelMapper.ensureInitialized()
        .encodeJson<GrantModel>(this as GrantModel);
  }

  Map<String, dynamic> toMap() {
    return GrantModelMapper.ensureInitialized()
        .encodeMap<GrantModel>(this as GrantModel);
  }

  GrantModelCopyWith<GrantModel, GrantModel, GrantModel> get copyWith =>
      _GrantModelCopyWithImpl<GrantModel, GrantModel>(
          this as GrantModel, $identity, $identity);
  @override
  String toString() {
    return GrantModelMapper.ensureInitialized()
        .stringifyValue(this as GrantModel);
  }

  @override
  bool operator ==(Object other) {
    return GrantModelMapper.ensureInitialized()
        .equalsValue(this as GrantModel, other);
  }

  @override
  int get hashCode {
    return GrantModelMapper.ensureInitialized().hashValue(this as GrantModel);
  }
}

extension GrantModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GrantModel, $Out> {
  GrantModelCopyWith<$R, GrantModel, $Out> get $asGrantModel =>
      $base.as((v, t, t2) => _GrantModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GrantModelCopyWith<$R, $In extends GrantModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      int? status,
      String? name,
      String? location,
      String? type,
      String? gender,
      String? age_range,
      String? website,
      String? url,
      String? amount,
      String? description,
      String? requirements,
      String? geo_focus,
      String? founder,
      DateTime? deadline,
      DateTime? created_at,
      DateTime? updated_at,
      String? criteria,
      String? sector,
      String? region,
      double? score,
      String? grant_eligibility,
      double? priority_score});
  GrantModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GrantModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GrantModel, $Out>
    implements GrantModelCopyWith<$R, GrantModel, $Out> {
  _GrantModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GrantModel> $mapper =
      GrantModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? status = $none,
          Object? name = $none,
          Object? location = $none,
          Object? type = $none,
          Object? gender = $none,
          Object? age_range = $none,
          Object? website = $none,
          Object? url = $none,
          Object? amount = $none,
          Object? description = $none,
          Object? requirements = $none,
          Object? geo_focus = $none,
          Object? founder = $none,
          Object? deadline = $none,
          Object? created_at = $none,
          Object? updated_at = $none,
          Object? criteria = $none,
          Object? sector = $none,
          Object? region = $none,
          Object? score = $none,
          Object? grant_eligibility = $none,
          Object? priority_score = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (status != $none) #status: status,
        if (name != $none) #name: name,
        if (location != $none) #location: location,
        if (type != $none) #type: type,
        if (gender != $none) #gender: gender,
        if (age_range != $none) #age_range: age_range,
        if (website != $none) #website: website,
        if (url != $none) #url: url,
        if (amount != $none) #amount: amount,
        if (description != $none) #description: description,
        if (requirements != $none) #requirements: requirements,
        if (geo_focus != $none) #geo_focus: geo_focus,
        if (founder != $none) #founder: founder,
        if (deadline != $none) #deadline: deadline,
        if (created_at != $none) #created_at: created_at,
        if (updated_at != $none) #updated_at: updated_at,
        if (criteria != $none) #criteria: criteria,
        if (sector != $none) #sector: sector,
        if (region != $none) #region: region,
        if (score != $none) #score: score,
        if (grant_eligibility != $none) #grant_eligibility: grant_eligibility,
        if (priority_score != $none) #priority_score: priority_score
      }));
  @override
  GrantModel $make(CopyWithData data) => GrantModel(
      id: data.get(#id, or: $value.id),
      status: data.get(#status, or: $value.status),
      name: data.get(#name, or: $value.name),
      location: data.get(#location, or: $value.location),
      type: data.get(#type, or: $value.type),
      gender: data.get(#gender, or: $value.gender),
      age_range: data.get(#age_range, or: $value.age_range),
      website: data.get(#website, or: $value.website),
      url: data.get(#url, or: $value.url),
      amount: data.get(#amount, or: $value.amount),
      description: data.get(#description, or: $value.description),
      requirements: data.get(#requirements, or: $value.requirements),
      geo_focus: data.get(#geo_focus, or: $value.geo_focus),
      founder: data.get(#founder, or: $value.founder),
      deadline: data.get(#deadline, or: $value.deadline),
      created_at: data.get(#created_at, or: $value.created_at),
      updated_at: data.get(#updated_at, or: $value.updated_at),
      criteria: data.get(#criteria, or: $value.criteria),
      sector: data.get(#sector, or: $value.sector),
      region: data.get(#region, or: $value.region),
      score: data.get(#score, or: $value.score),
      grant_eligibility:
          data.get(#grant_eligibility, or: $value.grant_eligibility),
      priority_score: data.get(#priority_score, or: $value.priority_score));

  @override
  GrantModelCopyWith<$R2, GrantModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GrantModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
