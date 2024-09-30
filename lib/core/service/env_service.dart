import 'package:app_mobile/core/extensions/extensions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../constants/env/env_constants.dart';

/// Class defined for env service to fetch values
class EnvService {
  static getString({required String key}) async =>
      dotenv.env[EnvConstants.debug].onNull();

  static getBool({required String key}) async =>
      dotenv.env[EnvConstants.debug].onNullBool();
}
