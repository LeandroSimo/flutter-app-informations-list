// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$nameUserComputed;

  @override
  bool get nameUser => (_$nameUserComputed ??=
          Computed<bool>(() => super.nameUser, name: '_LoginStore.nameUser'))
      .value;
  Computed<bool>? _$emailUserComputed;

  @override
  bool get emailUser => (_$emailUserComputed ??=
          Computed<bool>(() => super.emailUser, name: '_LoginStore.emailUser'))
      .value;
  Computed<bool>? _$passwordUserComputed;

  @override
  bool get passwordUser =>
      (_$passwordUserComputed ??= Computed<bool>(() => super.passwordUser,
              name: '_LoginStore.passwordUser'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginStore.isFormValid'))
          .value;

  late final _$userAtom = Atom(name: '_LoginStore.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isObscureAtom =
      Atom(name: '_LoginStore.isObscure', context: context);

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LoginStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loggedInAtom =
      Atom(name: '_LoginStore.loggedIn', context: context);

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  late final _$readOnlyAtom =
      Atom(name: '_LoginStore.readOnly', context: context);

  @override
  bool get readOnly {
    _$readOnlyAtom.reportRead();
    return super.readOnly;
  }

  @override
  set readOnly(bool value) {
    _$readOnlyAtom.reportWrite(value, super.readOnly, () {
      super.readOnly = value;
    });
  }

  late final _$controllerDataAtom =
      Atom(name: '_LoginStore.controllerData', context: context);

  @override
  TextEditingController get controllerData {
    _$controllerDataAtom.reportRead();
    return super.controllerData;
  }

  @override
  set controllerData(TextEditingController value) {
    _$controllerDataAtom.reportWrite(value, super.controllerData, () {
      super.controllerData = value;
    });
  }

  late final _$controllerPasswordAtom =
      Atom(name: '_LoginStore.controllerPassword', context: context);

  @override
  TextEditingController get controllerPassword {
    _$controllerPasswordAtom.reportRead();
    return super.controllerPassword;
  }

  @override
  set controllerPassword(TextEditingController value) {
    _$controllerPasswordAtom.reportWrite(value, super.controllerPassword, () {
      super.controllerPassword = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginStore.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void setUserEmail(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setUserEmail');
    try {
      return super.setUserEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserName(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscure() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setObscure');
    try {
      return super.setObscure();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReadOnly(bool value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setReadOnly');
    try {
      return super.setReadOnly(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isObscure: ${isObscure},
loading: ${loading},
loggedIn: ${loggedIn},
readOnly: ${readOnly},
controllerData: ${controllerData},
controllerPassword: ${controllerPassword},
nameUser: ${nameUser},
emailUser: ${emailUser},
passwordUser: ${passwordUser},
isFormValid: ${isFormValid}
    ''';
  }
}
