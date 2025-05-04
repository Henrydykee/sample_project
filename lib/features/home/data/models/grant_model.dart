import 'package:dart_mappable/dart_mappable.dart';

part 'grant_model.mapper.dart';

@MappableClass()
class GrantModel with GrantModelMappable {
  final int? id;
  final int? status;
  final String? name;
  final String? location;
  final String? type;
  final String? gender;
  final String? age_range;
  final String? website;
  final String? url;
  final String? amount;
  final String? description;
  final String? requirements;
  final String? geo_focus;
  final String? founder;
  final DateTime? deadline;
  final DateTime? created_at;
  final DateTime? updated_at;
  final String? criteria;
  final String? sector;
  final String? region;
  final double? score;
  final String? grant_eligibility;
  final double? priority_score;

  const GrantModel({
    this.id,
    this.status,
    this.name,
    this.location,
    this.type,
    this.gender,
    this.age_range,
    this.website,
    this.url,
    this.amount,
    this.description,
    this.requirements,
    this.geo_focus,
    this.founder,
    this.deadline,
    this.created_at,
    this.updated_at,
    this.criteria,
    this.sector,
    this.region,
    this.score,
    this.grant_eligibility,
    this.priority_score,
  });
}

