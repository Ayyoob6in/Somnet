import 'package:flutter/material.dart';

class LoginState with ChangeNotifier {
  // Private state variables
  bool _isEnglishSelected = true;
  bool _isTermsAccepted = false;
  final TextEditingController _phoneController =
      TextEditingController(); // Private field

  // Public getters
  bool get isEnglishSelected => _isEnglishSelected;
  bool get isTermsAccepted => _isTermsAccepted;
  TextEditingController get phoneController =>
      _phoneController; // Correct getter

  // Toggle language selection
  void toggleLanguage() {
    _isEnglishSelected = !_isEnglishSelected;
    notifyListeners(); // Notify listeners of the change
  }

  // Toggle terms and conditions acceptance
  void toggleTermsAccepted(bool value) {
    _isTermsAccepted = value;
    notifyListeners(); // Notify listeners of the change
  }

  @override
  void dispose() {
    _phoneController.dispose(); // Dispose of the private controller
    super.dispose();
  }
}
