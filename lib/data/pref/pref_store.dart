abstract class PrefStore {
  // Auth
  String? getAccessToken();
  Future<bool> saveAccessToken(String token);
  Future<bool> clearAccessToken();

  // User
  String? getUserId();
  Future<bool> saveUserId(String id);
  Future<bool> clearUserId();

  // Settings
  bool isDarkMode();
  Future<bool> setDarkMode(bool value);
  String getLanguage();
  Future<bool> setLanguage(String langCode);

  // Onboarding
  bool isFirstLaunch();
  Future<bool> setFirstLaunchDone();
}
