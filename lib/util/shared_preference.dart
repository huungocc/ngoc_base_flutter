import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/user_model.dart';
import '../gen/i18n/generated_locales/l10n.dart';

class SPrefCache {
  // share preference key
  static const String KEY_TOKEN = "auth_token";
  static const String PREF_KEY_LANGUAGE = "pref_key_language";
  static const String PREF_KEY_USER_INFO = "pref_key_user_info";
  static const String PREF_KEY_IS_KEEP_LOGIN = "pref_key_is_keep_login";
}

class SharedPreferenceUtil {
  static final prefs = new FlutterSecureStorage();

  static Future setCurrentLanguage(String token) async {
    await prefs.write(key: SPrefCache.PREF_KEY_LANGUAGE, value: token);
  }

  static Future<String> getCurrentLanguage() async {
    String? language = await prefs.read(key: SPrefCache.PREF_KEY_LANGUAGE);
    return language ?? AppLocalizationDelegate().supportedLocales.first.languageCode;
  }

  static Future saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SPrefCache.KEY_TOKEN, token);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SPrefCache.KEY_TOKEN) ?? '';
  }

  static Future saveKeepLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SPrefCache.PREF_KEY_IS_KEEP_LOGIN, value);
  }

  static Future<bool> isKeepLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SPrefCache.PREF_KEY_IS_KEEP_LOGIN) ?? false;
  }

  static Future saveUserInfo(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SPrefCache.PREF_KEY_USER_INFO, json.encode(user));
  }

  static Future<UserModel?> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(SPrefCache.PREF_KEY_USER_INFO);
    if (data == null) {
      return null;
    }
    return UserModel.fromJson(json.decode(data));
  }

  static Future clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
