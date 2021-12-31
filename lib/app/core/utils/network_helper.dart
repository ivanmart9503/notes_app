import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkHelper {
  static Future<bool> get isConnected async =>
      await InternetConnectionChecker().hasConnection;
}
