import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _secureStorage = const FlutterSecureStorage();

  // Store the access token
  Future<void> storeAccessToken(String accessToken) async {
    await _secureStorage.write(key: 'access_token', value: accessToken);
  }

  // Store the refresh token
  Future<void> storeRefreshToken(String refreshToken) async {
    await _secureStorage.write(key: 'refresh_token', value: refreshToken);
  }

  // Get the access token
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: 'access_token');
  }

  // Get the refresh token
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: 'refresh_token');
  }

  // Delete the access token
  Future<void> deleteAccessToken() async {
    await _secureStorage.delete(key: 'access_token');
  }

  // Delete the refresh token
  Future<void> deleteRefreshToken() async {
    await _secureStorage.delete(key: 'refresh_token');
  }

  // Delete both tokens
  Future<void> deleteTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }
}
