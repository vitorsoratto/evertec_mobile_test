import 'package:evertec_mobile_test/app/modules/login/bloc/login_bloc.dart';
import 'package:evertec_mobile_test/app/modules/login/login_view.dart';
import 'package:evertec_mobile_test/app/modules/login/repository/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.add<LoginRepository>(LoginRepository.new);
    i.add<LoginBloc>(LoginBloc.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) {
        return const LoginView();
      },
    );
  }
}
