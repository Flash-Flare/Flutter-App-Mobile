import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/di/dependency_injection.dart';
import '../../../../core/storage/local/app_settings_prefs.dart';
import '../../data/request/login_request.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginController extends GetxController {
  TextEditingController email =
      TextEditingController(text: "mayesh@flashflare.com");
  TextEditingController password =
      TextEditingController(text: 'mayesh@flashflare.com');
  var formKey = GlobalKey<FormState>();
  bool check = true;
  bool isObscurePassword = true;
  bool isLoading = false;

  onChangeObscurePassword() {
    isObscurePassword = !isObscurePassword;
    update();
  }

  onChange(bool status) {
    check = status;
    update();
  }

  void changeIsLoading({
    required bool value,
  }) {
    isLoading = value;
    update();
  }

  void performLogin() {
    if (formKey.currentState!.validate()) {
      loginRequest();
    }
  }

  void loginRequest() async {
    try {
      changeIsLoading(
        value: true,
      );
      LoginUseCase useCase = instance<LoginUseCase>();
      AppSettingsPrefs appSettingsPrefs = instance<AppSettingsPrefs>();

      (await useCase.execute(LoginRequest(
        email: email.text,
        password: password.text,
      )))
          .fold(
        (l) {
          changeIsLoading(
            value: false,
          );
        },
        (r) async {
          changeIsLoading(
            value: false,
          );
          if (check) {
          } else {
            appSettingsPrefs.setToken(
              token: r.data.token,
            );
          }
          //@todo: Write code to navigate main page
        },
      );
    } catch (e) {
      changeIsLoading(
        value: false,
      );
      //@todo: adding failed toast here
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    formKey.currentState!.dispose();
    super.dispose();
  }
}
