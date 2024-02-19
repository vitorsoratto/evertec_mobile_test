part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Login extends LoginEvent {
  final LoginModel loginModel;

  const Login({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}
