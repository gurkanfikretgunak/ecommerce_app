enum Flavor { development, test, production }

class AppConfig {
  final String appName;
  final Flavor flavor;

  static AppConfig? _instance;

  factory AppConfig({required String appName, required Flavor flavor}) {
    _instance ??= AppConfig._internal(appName, flavor);
    return _instance!;
  }

  AppConfig._internal(this.appName, this.flavor);

  static AppConfig get instance => _instance!;
}
