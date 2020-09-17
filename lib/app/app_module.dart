import 'package:flutter_app/app/pages/splash/splash_page.dart';

import 'pages/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/app/app_controller.dart';
import 'package:flutter_app/app/modules/home/home_controller.dart';
import 'package:flutter_app/app/modules/other/other_page.dart';
import 'package:flutter_app/app/shared/utils/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/app_widget.dart';
import 'package:flutter_app/app/modules/home/home_module.dart';

import 'modules/home/repositories/poke_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $SplashController,
        Bind((i) => AppController()),
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/routeOther', child: (context, args) => OtherPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
