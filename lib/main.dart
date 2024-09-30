import 'package:app_mobile/constants/di/dependency_injection.dart';
import 'package:app_mobile/core/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'constants/env/env_constants.dart';
import 'core/locale/locales.dart';
import 'core/resources/manager_translation.dart';
import 'core/routes/routes.dart';
import 'core/util/size_util.dart';

void main() async {
  await initModule();
  runApp(
    EasyLocalization(
      supportedLocales: localeSettings.locales,
      path: translationPath,
      fallbackLocale: localeSettings.defaultLocale,
      startLocale: localeSettings.defaultLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      defaultGlobalState: dotenv.env[EnvConstants.debug].onNullBool(),
      locale: localeSettings.defaultLocale,
      debugShowCheckedModeBanner: dotenv.env[EnvConstants.debug].onNullBool(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splash,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
