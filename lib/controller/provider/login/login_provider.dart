import 'package:flutter/material.dart';
import 'package:somenet/model/login_phone_number_status/login_phone_number_status.dart';
import 'package:somenet/service/auth/auth_service.dart';

class LoginState with ChangeNotifier {
  LoginState({required this.authService});

  final AuthService authService;
  LoginPhoneNumberStatus? _loginPhoneNumberStatus;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isEnglishSelected = true;
  bool _isTermsAccepted = false;
  final TextEditingController _phoneController = TextEditingController();

  LoginPhoneNumberStatus? get loginPhoneNumberStatus => _loginPhoneNumberStatus;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isEnglishSelected => _isEnglishSelected;
  bool get isTermsAccepted => _isTermsAccepted;
  TextEditingController get phoneController => _phoneController;

  void toggleLanguage() {
    _isEnglishSelected = !_isEnglishSelected;

    notifyListeners();
  }

  void toggleTermsAccepted(bool value) {
    _isTermsAccepted = value;
    notifyListeners();
  }

  Future<void> validatePhoneNumber(String phoneNumber) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _loginPhoneNumberStatus =
          await authService.fetchvalidatenumber(phoneNumber);
    } catch (e) {
      _errorMessage = e.toString(); // Store the error message
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String? validatePhoneNumberFormat(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (phoneNumber.length < 9) {
      return 'Phone number must be at least 9 digits';
    }
    return null;
  }

  Locale locale = Locale('en'); // Default English

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
