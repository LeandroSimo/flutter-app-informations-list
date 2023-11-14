import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import 'package:target/constants.dart';
import 'package:target/src/core/utils/validator.dart';
import 'package:target/src/models/user.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store, Validator {
  @observable
  User user = User();

  @observable
  bool isObscure = true;
  @observable
  bool loading = false;
  @observable
  bool loggedIn = false;
  @observable
  bool readOnly = false;
  @observable
  TextEditingController controllerData = TextEditingController();
  @observable
  TextEditingController controllerPassword = TextEditingController();

  @action
  void setUserEmail(String value) =>
      user.email = value.isNotEmpty ? value : null;
  @action
  void setUserName(String value) => user.name = value.isNotEmpty ? value : null;
  @action
  void setPassword(String value) =>
      user.password = value.isNotEmpty ? value : null;
  @action
  void setObscure() => isObscure = !isObscure;

  @action
  Future<void> login() async {
    var _tokenUser = '';
    var tokenUrl = _logged();

    if (user.name == users[0].name.toString() ||
        user.email == users[0].email.toString() &&
            user.password == users[0].password.toString()) {
      _tokenUser = users[0].token.toString();
    }
    if (user.name == users[1].name.toString() ||
        user.email == users[1].email.toString() &&
            user.password == users[1].password.toString()) {
      _tokenUser = users[0].token.toString();
    }

    if (_tokenUser.isNotEmpty || tokenUrl.toString().isNotEmpty) {
      loading = true;
      await Future.delayed(const Duration(seconds: 2));
      loading = false;
      loggedIn = true;
    }
  }

  Future<String> _logged() async {
    final response = await http.post(
      Uri.parse("$URL_BASE + login"),
      body: {
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final user = User.fromJson(data);
      return user.token.toString();
    } else {
      throw Exception('ERROR');
    }
  }

  @action
  void setReadOnly(bool value) => readOnly = value;

  @computed
  bool get nameUser => user.name!.isNotEmpty;
  @computed
  bool get emailUser => user.password!.isNotEmpty;
  @computed
  bool get passwordUser => user.password!.isNotEmpty;

  @computed
  bool get isFormValid =>
      userValidate(user.email) == null ||
      userValidate(user.name) == null &&
          passwordValidate(user.password) == null;
}
