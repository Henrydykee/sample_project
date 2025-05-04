import 'package:new_project/features/home/data/models/grant_model.dart';
import 'package:new_project/features/home/data/models/home_data_model.dart';
import '../../../../core/utils/data/guarded_datasource_calls.dart';
import '../../domain/repositories/grant_repositories.dart';
import '../datasource/grant_remote_datasource.dart';

class GrantRepositoryImpl implements GrantRepository {
  final GrantRemoteDataSource _remoteDataSource;

  GrantRepositoryImpl(
    this._remoteDataSource,
  ) {}

  @override
  Future<List<GrantModel>?> exploreGrants() async {
    final data = await guardedApiCall<List<GrantModel>>(() => _remoteDataSource.exploreGrants);
    return data;
  }

  @override
  Future<HomeDataModel?> getDashboardData() async {
    final data = await guardedApiCall<HomeDataModel>(() => _remoteDataSource.getDashboardData());
    return data;
  }

  @override
  Future<GrantModel?> getGrantDetail(String id) async {
    final data = await guardedApiCall<GrantModel>(() => _remoteDataSource.getGrantDetail(id));
    return data;
  }

  @override
  Future<List<GrantModel>?> getSavedGrants() async {
    final data = await guardedApiCall<List<GrantModel>>(() => _remoteDataSource.getSavedGrants());
    return data;
  }

  @override
  Future<String?> likeGrant(String id, String action) {
    final data = guardedApiCall<String>(() => _remoteDataSource.likeGrant(id, action));
    return data;
  }
}
