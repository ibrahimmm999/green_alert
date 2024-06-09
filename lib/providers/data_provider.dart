import 'package:flutter/material.dart';
import 'package:green_alert/services/data_service.dart';

class DataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _listData = [];
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  List<Map<String, dynamic>> get listData => _listData;

  set setListData(List<Map<String, dynamic>> listData) {
    _listData = listData;
    notifyListeners();
  }

  Future<bool> getData() async {
    try {
      _listData = await DataService().getLast7Data();
      print(_listData);
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    }
  }
}
