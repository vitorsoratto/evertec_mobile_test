import 'package:evertec_mobile_test/app/modules/init/init_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: InitModule());
  }
}
