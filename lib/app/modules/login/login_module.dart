import 'package:evertec_mobile_test/app/modules/login/login_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const LoginView(),
    );
  }
}
