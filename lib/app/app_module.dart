import 'package:evertec_mobile_test/app/modules/bloc/app_bloc.dart';
import 'package:evertec_mobile_test/app/modules/home/home_module.dart';
import 'package:evertec_mobile_test/app/modules/init/init_module.dart';
import 'package:evertec_mobile_test/app/modules/login/login_module.dart';
import 'package:evertec_mobile_test/app/shared/http/app_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<AppBloc>(AppBloc.new);
    i.addSingleton<AppDio>(AppDio.new);
  }

  @override
  void routes(r) {
    r.module('/', module: InitModule());
    r.module('/login/', module: LoginModule());
    r.module('/home/', module: HomeModule());
  }
}
