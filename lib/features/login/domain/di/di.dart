import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../../../constants/di/dependency_injection.dart';
import '../../../../core/network/app_api.dart';
import '../../data/data_source/login_data_source.dart';
import '../../data/repository/login_repository.dart';
import '../../presentation/controller/login_controller.dart';
import '../usecase/login_usecase.dart';

initLoginRequest() {
  if (!GetIt.I.isRegistered<LoginRemoteDataSource>()) {
    instance.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<LoginRepository>()));
  }
}

disposeLoginRequest() {
  if (GetIt.I.isRegistered<LoginRemoteDataSource>()) {
    instance.unregister<LoginRemoteDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }
}

initLogin() {
  initLoginRequest();
  Get.put(LoginController());
}

disposeLogin() {
  disposeLoginRequest();
  Get.delete<LoginController>();
}
