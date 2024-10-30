class AppConstants {
  const AppConstants._();
  static const String apiUrl = String.fromEnvironment("url");
  static const bool isMock = bool.fromEnvironment("isMock");
  //TODO Fill your api key
  static const String apiKey = '';
  static const String apiCountry = 'us';
}

class APIPath {
  static const String reelsPath = 'bytes/all';
}
