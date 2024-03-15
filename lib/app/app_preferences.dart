import 'package:flutter_advanced_course/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String appLanguage = "appLanguage";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    return _sharedPreferences.getString(appLanguage) ?? LanguageType.english.getValue();
  }
}
