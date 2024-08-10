import 'package:flutter/material.dart';

class EstatementState with ChangeNotifier {
  String _fromDate = "18";
  String _fromMonth = "June";
  String _fromYear = "2021";
  String _toDate = "18";
  String _toMonth = "July";
  String _toYear = "2021";

  String get fromDate => _fromDate;
  String get fromMonth => _fromMonth;
  String get fromYear => _fromYear;
  String get toDate => _toDate;
  String get toMonth => _toMonth;
  String get toYear => _toYear;

  void setFromDate(String newDate) {
    _fromDate = newDate;
    notifyListeners();
  }

  void setFromMonth(String newMonth) {
    _fromMonth = newMonth;
    notifyListeners();
  }

  void setFromYear(String newYear) {
    _fromYear = newYear;
    notifyListeners();
  }

  void setToDate(String newDate) {
    _toDate = newDate;
    notifyListeners();
  }

  void setToMonth(String newMonth) {
    _toMonth = newMonth;
    notifyListeners();
  }

  void setToYear(String newYear) {
    _toYear = newYear;
    notifyListeners();
  }
}
