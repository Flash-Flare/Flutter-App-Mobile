import 'package:app_mobile/features/login/data/mapper/login_data_mapper.dart';
import 'package:app_mobile/features/login/data/response/login_response.dart';
import 'package:app_mobile/features/login/domain/model/login_model.dart';

extension LoginMapper on LoginResponse {
  LoginModel toDomain() => LoginModel(
        data: data!.toDomain(),
      );
}
