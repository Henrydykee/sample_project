import 'package:new_project/features/home/domain/usecases/saved_grants.dart';
import 'explore_grants.dart';
import 'get_dashboard_data.dart';
import 'get_grant_detail.dart';
import 'like_grant.dart';

class  GrantUsecases {
  ExploreGrants exploreGrants;
  GetDashboardData getDashboardData;
  GetGrantDetail getGrantDetail;
  LikeGrant likeGrant;
  GetSavedGrants getSavedGrants;


  GrantUsecases(
      this.getDashboardData,
      this.exploreGrants,
      this.getGrantDetail,
      this.likeGrant,
      this.getSavedGrants
      );
}