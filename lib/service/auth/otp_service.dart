import 'dart:convert';
import 'dart:developer'; // Import for logging
import 'package:http/http.dart' as http;
import 'package:somenet/model/otp_response/otp_response.dart';
import 'package:somenet/utils/helper/helper.dart';
import 'package:somenet/utils/secure/secure_storage.dart';
import 'package:somenet/utils/urls/api_urls.dart';
// Import SecureStorage

class OtpService {
  final String validatePhoneNumberUrl = "${ApiUrls.baseUrl}${ApiUrls.otpUrl}";
  final SecureStorage secureStorage =
      SecureStorage(); // Initialize SecureStorage

  Future<OtpResponse> validateOtp({
    required String phoneNumber,
    required int otp,
  }) async {
    if (phoneNumber.isEmpty) {
      throw ArgumentError('Phone number cannot be empty.');
    }

    try {
      final formattedPhoneNumber = "+252$phoneNumber";
      final body = json.encode({
        'msisdn': formattedPhoneNumber,
        'code': otp,
      });
      log(phoneNumber);
      final headers = {'Content-Type': 'application/json'};

      final response = await http.post(
        Uri.parse(validatePhoneNumberUrl),
        body: body,
        headers: headers,
      );

      log('Request URL: $validatePhoneNumberUrl');
      log('Request Body: $body');
      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody == null || responseBody.isEmpty) {
          throw Exception('Empty response body');
        }

        // Parse the response body to create an OtpResponse object
        OtpResponse otpResponse = OtpResponse.fromJson(responseBody);

        // Store the accessToken and refreshToken in secure storage
        await secureStorage.storeAccessToken(otpResponse.data.toString());
        await secureStorage
            .storeRefreshToken(otpResponse.refreshToken.toString());
        HelperFunction.saveUserLoggedInStatus(true);

        return otpResponse;
      } else {
        final errorMessage = 'Unexpected status code: ${response.statusCode}';
        log(errorMessage);
        throw Exception(errorMessage);
      }
    } catch (e, stackTrace) {
      log('Exception occurred: $e', stackTrace: stackTrace);
      throw Exception('Failed to validate OTP: $e');
    }
  }
}
