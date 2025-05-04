import 'package:dart_mappable/dart_mappable.dart';

import 'dashboard_data_model.dart';
import 'grant_model.dart';

part 'home_data_model.mapper.dart';

@MappableClass()
class HomeDataModel with HomeDataModelMappable {
  final List<GrantModel>? grants;
  final DashboardData? data;

  const HomeDataModel({
     this.grants,
     this.data,
  });
}
