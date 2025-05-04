import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_project/core/presentation/domain/ui_exceptions.dart';
import 'package:new_project/features/home/data/models/home_data_model.dart';
import 'package:new_project/features/home/domain/usecases/grant_usecases.dart';
import 'package:new_project/features/home/domain/usecases/like_grant.dart';
import '../../../../core/presentation/state/provider_state.dart';
import '../../data/models/grant_model.dart';

class GrantProvider with ChangeNotifier, ProviderState {
  GrantUsecases useCases;

  GrantProvider(this.useCases) {}

  void _setState({loading = false, isReady = false, hasError = false, errorMsg = '', payload}) {
    update(loading: loading, hasErr: hasError, errorMsg: errorMsg, ready: isReady, statePayload: payload);
    notifyListeners();
  }


  HomeDataModel? dashboardData;

  Future getGrantDetail(String id) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, GrantModel>? response = await useCases.getGrantDetail(id);
    response?.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future getDashboardData() async {
    print("object");
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, HomeDataModel>? response = await useCases.getDashboardData();
    response?.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      dashboardData = r;
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future savedGrants() async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, List<GrantModel>>? response = await useCases.getSavedGrants();
    response?.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future exploreGrants() async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, List<GrantModel>>? response = await useCases.exploreGrants();
    response?.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future likeGrant(String id, String action) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, String>? response = await useCases.likeGrant(LikeGrantParams(id: id, action: action));
    response?.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }
}
