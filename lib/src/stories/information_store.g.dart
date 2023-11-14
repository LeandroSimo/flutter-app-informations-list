// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationStore on InformationStoreBase, Store {
  Computed<bool>? _$isInformationValidComputed;

  @override
  bool get isInformationValid => (_$isInformationValidComputed ??=
          Computed<bool>(() => super.isInformationValid,
              name: 'InformationStoreBase.isInformationValid'))
      .value;

  late final _$prefsAtom =
      Atom(name: 'InformationStoreBase.prefs', context: context);

  @override
  SharedPreferences get prefs {
    _$prefsAtom.reportRead();
    return super.prefs;
  }

  @override
  set prefs(SharedPreferences value) {
    _$prefsAtom.reportWrite(value, super.prefs, () {
      super.prefs = value;
    });
  }

  late final _$informationAtom =
      Atom(name: 'InformationStoreBase.information', context: context);

  @override
  Information get information {
    _$informationAtom.reportRead();
    return super.information;
  }

  @override
  set information(Information value) {
    _$informationAtom.reportWrite(value, super.information, () {
      super.information = value;
    });
  }

  late final _$readOnlyAtom =
      Atom(name: 'InformationStoreBase.readOnly', context: context);

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

  late final _$informationControllerAtom = Atom(
      name: 'InformationStoreBase.informationController', context: context);

  @override
  TextEditingController get informationController {
    _$informationControllerAtom.reportRead();
    return super.informationController;
  }

  @override
  set informationController(TextEditingController value) {
    _$informationControllerAtom.reportWrite(value, super.informationController,
        () {
      super.informationController = value;
    });
  }

  late final _$informationControllerEditAtom = Atom(
      name: 'InformationStoreBase.informationControllerEdit', context: context);

  @override
  TextEditingController get informationControllerEdit {
    _$informationControllerEditAtom.reportRead();
    return super.informationControllerEdit;
  }

  @override
  set informationControllerEdit(TextEditingController value) {
    _$informationControllerEditAtom
        .reportWrite(value, super.informationControllerEdit, () {
      super.informationControllerEdit = value;
    });
  }

  late final _$InformationStoreBaseActionController =
      ActionController(name: 'InformationStoreBase', context: context);

  @override
  void initStore() {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.initStore');
    try {
      return super.initStore();
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addInformation() {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.addInformation');
    try {
      return super.addInformation();
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editInformation({required int index}) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.editInformation');
    try {
      return super.editInformation(index: index);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInformation({required int index}) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.removeInformation');
    try {
      return super.removeInformation(index: index);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInformationValue({required int currentFilterItemIndex}) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.setInformationValue');
    try {
      return super
          .setInformationValue(currentFilterItemIndex: currentFilterItemIndex);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInformation(String value) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.setInformation');
    try {
      return super.setInformation(value);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReadOnly(bool value) {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.setReadOnly');
    try {
      return super.setReadOnly(value);
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearInformation() {
    final _$actionInfo = _$InformationStoreBaseActionController.startAction(
        name: 'InformationStoreBase.clearInformation');
    try {
      return super.clearInformation();
    } finally {
      _$InformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
prefs: ${prefs},
information: ${information},
readOnly: ${readOnly},
informationController: ${informationController},
informationControllerEdit: ${informationControllerEdit},
isInformationValid: ${isInformationValid}
    ''';
  }
}
