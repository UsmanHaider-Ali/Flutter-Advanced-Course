import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImplementer(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected async => await _internetConnectionChecker.hasConnection;
}
