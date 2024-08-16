import 'package:flutter/material.dart';
import 'package:somenet/service/auth/otp_service.dart';
import 'package:somenet/model/otp_response/otp_response.dart';

class OtpProvider extends ChangeNotifier {
  final OtpService _otpService = OtpService(); // Initialize OtpService

  bool _isLoading = false;
  String? _errorMessage;
  OtpResponse? _otpResponse;
  String _otpCode = ''; // Property to store the entered OTP code

  // Getters for loading state, error message, and OTP response
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  OtpResponse? get otpResponse => _otpResponse;
  String get otpCode => _otpCode; // Getter for the OTP code

  // Setter for the OTP code
  set otpCode(String value) {
    _otpCode = value;
    notifyListeners(); // Notify listeners when OTP code is updated
  }

  // Method to validate OTP
  Future<void> validateOtp(String phoneNumber, int otp) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify listeners to update UI

    try {
      _otpResponse = await _otpService.validateOtp(
        phoneNumber: phoneNumber,
        otp: otp,
      );
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners to update UI
    }
  }
}
