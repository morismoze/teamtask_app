class StorageKeys {
  StorageKeys._();

  static const String token = 'token';
  static const String tokenExpires = 'token_expires';
  static const String refreshToken = 'refresh_token';
}

abstract class StorageService {
  Future<void> deleteValue(String key);

  dynamic getValue(String key);

  dynamic getAll();

  Future<void> clear();

  bool hasValue(String key);

  Future<void> setValue(String key, data);
}
