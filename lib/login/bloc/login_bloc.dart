import 'package:block_with_flutter/login/bloc/login_event.dart';
import 'package:block_with_flutter/login/bloc/login_state.dart';
import 'package:block_with_flutter/login/model/login_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_response_model.dart';
import '../repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
    LoginBloc() : super(LoginInialState()) {
      on<LoginReqEvent>((event, emit) async {
        emit(LoginLoadingState());
        try {
          LoginResponseModel loginResponse = await LoginRepo().login(
            event.loginReqestModel.username?? " ",
            event.loginReqestModel.password?? "",
          );
          emit(LoginLoadedState(loginResponse: loginResponse));
        } catch (e) {
          emit(LoginErrorState(e.toString()));
        }
      });

    }


}