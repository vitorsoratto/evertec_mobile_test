import 'package:evertec_mobile_test/app/modules/init/splash_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const SplashView(),
    );
  }
}
