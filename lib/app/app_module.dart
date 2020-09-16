import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/app/app_controller.dart';
import 'package:flutter_app/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}
