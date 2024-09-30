import 'package:app_mobile/features/login/domain/model/login_model.dart';
import '../../../../core/error_handler/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/repository/login_repository.dart';
import '../../data/request/login_request.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginRequest, LoginModel> {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, LoginModel>> execute(LoginRequest request) async {
    return await _repository.login(
      request,
    );
  }
}
