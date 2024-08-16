import 'dart:convert';
import 'dart:developer'; // Import for logging
import 'package:http/http.dart' as http;
import 'package:somenet/model/login_phone_number_status/login_phone_number_status.dart';
import 'package:somenet/utils/urls/api_urls.dart';

class AuthService {
  final String validatePhoneNumberUrl = "${ApiUrls.baseUrl}${ApiUrls.loginUrl}";

  Future<LoginPhoneNumberStatus> fetchvalidatenumber(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      throw Exception('Phone number cannot be empty.');
    }

    try {
      final formattedPhoneNumber = "+252$phoneNumber";
      final body = json.encode({'msisdn': formattedPhoneNumber});
      final headers = {'Content-Type': 'application/json'};

      final response = await http.post(
        Uri.parse(validatePhoneNumberUrl),
        body: body,
        headers: headers,
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['result'] == 'error') {
          // If the result is 'error', throw the error description
          final errorDesc =
              responseBody['errorDesc'] ?? 'Unknown error occurred';
          throw Exception(errorDesc);
        }

        // Parse the response body to create a LoginPhoneNumberStatus object
        return LoginPhoneNumberStatus.fromJson(responseBody);
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Exception: $e');
      throw Exception('Failed to validate phone number: $e');
    }
  }
}
