import 'package:equatable/equatable.dart';

import '../model/login_response_model.dart';

abstract class LoginState extends Equatable {

}
class LoginInialState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class LoginLoadingState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class LoginLoadedState extends LoginState{
  final LoginResponseModel loginResponse;

  LoginLoadedState( {required this.loginResponse});

  @override
  List<Object?> get props => [loginResponse];
}
class LoginErrorState extends LoginState{
  String error;

  LoginErrorState(this.error);

  @override
  List<Object?> get props =>[error];

}