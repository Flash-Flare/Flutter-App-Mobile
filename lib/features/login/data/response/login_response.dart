import 'package:app_mobile/core/base_response/base_response.dart';
import 'package:app_mobile/features/login/data/response/login_data_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../constants/response_constants/response_constants.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: ResponseConstants.data)
  LoginDataResponse? data;

  LoginResponse({
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
