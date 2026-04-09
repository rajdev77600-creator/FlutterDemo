import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';
import 'model/login_request_model.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<LoginBloc>(context),
        builder: (context, state) {
          if (state is LoginInialState)
          {
            return  Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed:() {
                    var bloc= BlocProvider.of<LoginBloc>(context);
                    var loginReqestModel = LoginReqestModel(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
                    bloc.add(LoginReqEvent(loginReqestModel));
                  }, child: Text("Login Button")),
                ],
              ),
            );
          }
          else if (state is LoginLoadingState) {
            return CircularProgressIndicator();
          }
          else if (state is LoginLoadedState) {
            return Container(
              child: Text(state.loginResponse.email?? ""),
            );
          }
          else if (state is LoginErrorState) {
            return  Container(
              child: Text(state.error,),
            );
          } else {
            return Text("Initial State");
          }
        }
      )
    );
  }
}
