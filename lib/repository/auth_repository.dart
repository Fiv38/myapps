import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../api/api_client.dart';

class AuthRepository {
  static const String tokenKey = 'accessToken';
  static const String userKey = 'currentUser';

  final APIClient apiClient;
  final SharedPreferences prefs;

  AuthRepository({required this.apiClient, required this.prefs});

  /// Saves a User object to SharedPreferences.
  Future<void> saveUser(User user) async {
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(userKey, userJson);
  }

  /// Retrieves the stored User object from SharedPreferences.
  Future<User?> getUser() async {
    final userJson = prefs.getString(userKey);
    if (userJson == null) return null;
    return User.fromJson(jsonDecode(userJson));
  }

  /// Removes the stored User object.
  Future<void> removeUser() async {
    await prefs.remove(userKey);
  }

  /// Saves the token to SharedPreferences.
  Future<void> saveToken(String token) async {
    await prefs.setString(tokenKey, token);
  }

  /// Retrieves the stored token.
  Future<String?> getToken() async {
    return prefs.getString(tokenKey);
  }

  /// Clears the stored token.
  Future<void> clearToken() async {
    await prefs.remove(tokenKey);
  }

  /// Checks if the stored token is valid (not empty).
  Future<bool> checkTokenValidity() async {
    final token = prefs.getString(tokenKey);
    return token != null && token.isNotEmpty;
  }

  /// Clears both token and user from SharedPreferences (full logout).
  Future<void> clearAll() async {
    await prefs.remove(tokenKey);
    await prefs.remove(userKey);
  }
}
