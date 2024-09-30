import 'package:app_mobile/core/service/env_service.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../constants/env/env_constants.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionCheckerPlus _internetConnectionChecker;

  NetworkInfoImp(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => EnvService.getBool(key: EnvConstants.debug)
      ? Future.value(true)
      : _internetConnectionChecker.hasConnection;
}
