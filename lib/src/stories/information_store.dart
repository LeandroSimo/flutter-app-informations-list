import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target/constants.dart';
import 'package:target/src/models/information.dart';

part 'information_store.g.dart';

class InformationStore = InformationStoreBase with _$InformationStore;

abstract class InformationStoreBase with Store {
  InformationStoreBase(this.prefs) {
    initStore();
  }

  @observable
  SharedPreferences prefs;

  @observable
  Information information = Information();

  @observable
  bool readOnly = true;

  @observable
  TextEditingController informationController = TextEditingController();

  @observable
  TextEditingController informationControllerEdit = TextEditingController();

  ObservableList<Information> informationList = ObservableList<Information>();

  @action
  void initStore() {
    _getListPrefs();
    information.information = informationController.text;
  }

  @action
  void addInformation() {
    if (informationController.text.isNotEmpty) {
      var _newInformation =
          Information(information: informationController.text);
      informationList.add(_newInformation);
      _saveInformationPrefs();
      clearInformation();
    }
  }

  @action
  void editInformation({required int index}) {
    informationList[index].information = informationControllerEdit.text;
  }

  @action
  void removeInformation({required int index}) {
    informationList.removeAt(index);
    _saveInformationPrefs();
  }

  void _saveInformationPrefs() {
    List<String> _newList = informationList
        .map((element) => jsonEncode(element))
        .toList()
        .asObservable();
    prefs.setStringList(LIST_TOKEN, _newList).asObservable();
  }

  List<Information> _getListPrefs() {
    List<String>? _list = prefs.getStringList(LIST_TOKEN);
    if (_list != null) {
      informationList = _list
          .map((element) => Information.fromJson(jsonDecode(element)))
          .toList()
          .asObservable();
    }
    return informationList.asObservable();
  }

  @action
  void setInformationValue({
    required int currentFilterItemIndex,
  }) {
    informationControllerEdit.text =
        informationList[currentFilterItemIndex].information!;
  }

  @action
  void setInformation(String value) => information = value.isNotEmpty
      ? Information(information: value)
      : Information(information: '');

  @action
  void setReadOnly(bool value) => readOnly = value;

  @computed
  bool get isInformationValid => information.information!.isNotEmpty;

  @action
  void clearInformation() {
    informationController.clear();
    information.information = informationController.text;
  }
}
