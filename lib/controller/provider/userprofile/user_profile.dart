import 'dart:io';

import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier {
  String _selectedGender = 'Male';
  File? _profileImage;

  String get selectedGender => _selectedGender;
  File? get profileImage => _profileImage;

  void setSelectedGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void setProfileImage(File image) {
    _profileImage = image;
    notifyListeners();
  }
}
