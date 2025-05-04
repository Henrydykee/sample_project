

import '../../data/models/grant_model.dart';
import '../../data/models/home_data_model.dart';

abstract class GrantRepository {
  Future<HomeDataModel?> getDashboardData();
  Future<List<GrantModel>?> exploreGrants();
  Future<List<GrantModel>?> getSavedGrants();
  Future<GrantModel?> getGrantDetail(String id);
  Future<String?> likeGrant(String id, String action);

}