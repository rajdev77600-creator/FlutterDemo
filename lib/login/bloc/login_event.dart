import 'package:equatable/equatable.dart';

import '../model/login_request_model.dart';

abstract class LoginEvent extends Equatable {

}
class LoginReqEvent extends LoginEvent{
  final LoginReqestModel loginReqestModel;
  LoginReqEvent(this.loginReqestModel);

  @override
  // TODO: implement props
  List<Object?> get props => [loginReqestModel];

}