import 'package:dart_mappable/dart_mappable.dart';

part 'dashboard_data_model.mapper.dart';

@MappableClass()
class DashboardData with DashboardDataMappable {
  final String? total_grant_amount;
  final int? count;
  final int? due_in_thirty_day;
  final int? high_eligibility_count;

  const DashboardData({
    this.total_grant_amount,
    this.count,
    this.due_in_thirty_day,
    this.high_eligibility_count,
  });
}

