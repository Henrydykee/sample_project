class GrantEndpoints {
  static String getDashboardData = "/dashboard";
  static String exploreGrants = "/explore-grant";
  static String searchGrants = "/search";
  static String getSavedGrants = "/saved-grant";
  static String getGrantDetail(String id) => "/grant-details/$id";
  static String likeGrant(String id, String action) => "/grant/$id/$action";
}
