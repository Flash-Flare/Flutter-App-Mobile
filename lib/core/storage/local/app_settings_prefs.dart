import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/shared_prefs_constants/shared_prefs_constants.dart';

class AppSettingsPrefs {
  final SharedPreferences _sharedPreferences;

  clear() {
    _sharedPreferences.clear();
  }

  AppSettingsPrefs(
    this._sharedPreferences,
  );

  String getLocale() {
    return _sharedPreferences
        .getString(
          SharedPrefsConstants.locale,
        )
        //@todo: Here using the function pareWithDefaultLocale
        .toString();
  }

  Future<void> setLocale({
    required String locale,
  }) async {
    await _sharedPreferences.setString(
      SharedPrefsConstants.locale,
      locale,
    );
  }

  Future<void> setOutBoardingScreenViewed() async {
    await _sharedPreferences.setBool(
      SharedPrefsConstants.outBoardingViewed,
      true,
    );
  }

  bool getOutBoardingScreenViewed() {
    return _sharedPreferences.getBool(
          SharedPrefsConstants.outBoardingViewed,
        )
        //@todo: Adding on null
        ??
        true;
  }

  Future<void> setUserLoggedIn() async {
    await _sharedPreferences.setBool(
      SharedPrefsConstants.isLoggedIn,
      true,
    );
  }

  bool getUserLoggedIn() {
    return _sharedPreferences.getBool(
          SharedPrefsConstants.isLoggedIn,
        ) ??
        true;
    //@todo: Adding on Null
  }

  Future<void> setToken({
    required String token,
  }) async {
    await _sharedPreferences.setString(
      SharedPrefsConstants.token,
      token,
    );
  }

  String getToken() {
    return _sharedPreferences.getString(SharedPrefsConstants.token) ?? "true";
    //@todo: Adding on Null
  }
}
