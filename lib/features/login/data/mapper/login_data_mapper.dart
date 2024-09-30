import 'package:app_mobile/core/extensions/extensions.dart';
import 'package:app_mobile/features/login/data/response/login_data_response.dart';
import 'package:app_mobile/features/login/domain/model/login_data_model.dart';

extension LoginDataMapper on LoginDataResponse {
  LoginDataModel toDomain() => LoginDataModel(
        token: token.onNull(),
      );
}
