import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evertec_mobile_test/app/modules/login/classes/login_model.dart';
import 'package:evertec_mobile_test/app/modules/login/repository/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>(_onLogin);
  }

  void _onLogin(Login event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    LoginModel loginModel = event.loginModel;

    LoginRepository loginRepository = Modular.get<LoginRepository>();

    bool success = await loginRepository.login(loginModel);

    if (success) {
      emit(LoginSuccess());
      Modular.to.navigate('/home');
    } else {
      _isEmpty(loginModel) ? emit(LoginEmpty()) : emit(LoginFailed());
    }
  }

  bool _isEmpty(LoginModel loginModel) {
    return (loginModel.document.isEmpty ||
        loginModel.documentNumber.isEmpty ||
        loginModel.password.isEmpty);
  }
}
