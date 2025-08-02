import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkUtils {
  static Future<bool> isConnected({
    Duration timeout = const Duration(seconds: 3),
  }) async {
    try {
      // gunakan named-constructor terbaru
      final checker = InternetConnectionChecker.createInstance();

      // true  = ada internet
      // false = tidak ada internet / timeout
      return await checker.hasConnection.timeout(timeout);
    } catch (_) {
      return false;
    }
  }
}
