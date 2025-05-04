
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_project/features/auth/data/models/user_model.dart';
import 'package:new_project/features/auth/domain/usecases/authentication_usecases.dart';
import 'package:new_project/features/auth/domain/usecases/update_user.dart';

import '../../../../core/presentation/domain/ui_exceptions.dart';
import '../../../../core/presentation/state/provider_state.dart';
import '../../data/models/create_organisation.dart';
import '../../data/models/register_user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/reset_password.dart';

class AuthenticationProvider with ChangeNotifier, ProviderState {
  AuthenticationUsecases useCases;

  AuthenticationProvider(this.useCases) {}

  void _setState({loading = false, isReady = false, hasError = false, errorMsg = '', payload}) {
    update(loading: loading, hasErr: hasError, errorMsg: errorMsg, ready: isReady, statePayload: payload);
    notifyListeners();
  }

  Future createOrg(CreateOrganizationParams createOrganizationParams) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, String>? response = await useCases.createOrganisation(createOrganizationParams);
    response.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future login({required String email, required String password}) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, UserModel>? response = await useCases.login(LoginParams(
      email: email,
      password: password,
    ));

    response.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future createUser({required String email, required String password, required String firstName, required String lastName, required String phone}) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, String>? response = await useCases.registerUser(RegisterUserParams(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    ));
    response.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future resetPassword({required String email, required String password, required String token}) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, String>? response = await useCases.resetPassword(ResetPasswordParams(
      email: email,
      password: password,
      token: token,
    ));
    response.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future requestPasswordRest(String email) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, String>? response = await useCases.requestPasswordReset(email);
    response.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future updateUser(UpdateUserParams params) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, UserModel>? response = await useCases.updateUser(params);
    response.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }

  Future updateProfileImage(XFile image) async {
    _setState(
      loading: true,
      hasError: false,
    );
    Either<UIError, String>? response = await useCases.updateProfileImage(image);
    response.fold((l) {
      _setState(loading: false, hasError: true, errorMsg: l.message, payload: null);
      notifyListeners();
    }, (r) {
      _setState(loading: false, hasError: false, payload: r.toString());
      notifyListeners();
    });
  }
}
