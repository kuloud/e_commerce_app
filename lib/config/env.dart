class Env {
  static const String channel =
      String.fromEnvironment('CHANNEL', defaultValue: 'None');
  static const bool inProduction = bool.fromEnvironment("dart.vm.product");
}
