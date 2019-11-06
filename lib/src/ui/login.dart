import 'package:flutter/material.dart';
import 'package:login_with_localapi/src/blocs/validator_provider.dart';
import 'package:login_with_localapi/src/models/login_model.dart';
import 'package:login_with_localapi/src/models/response_login_model.dart';
import 'package:login_with_localapi/src/ui/home.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBlocProvider.of(context);
    LoginPost loginPost;
        return Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              emailField(bloc),
              passwordField(bloc),
              Container(margin: EdgeInsets.only(top: 30.0)),
              submitButton(bloc),
            ],
          ),

    );
  }

  Widget emailField(bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
              hintText: 'Must contain 6 characters',
              labelText: 'Password',
              errorText: snapshot.error
          ),
          obscureText: true,
        );
      },
    );
  }

  Widget submitButton(bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue[700],
          textColor: Colors.white,
          onPressed:(){
            if(snapshot.hasData){
              return StreamBuilder<ResponseLogin>(
                  stream: bloc.loginPostResponse,
                  builder: (context, AsyncSnapshot<ResponseLogin>itemSnapshot){
                    if(itemSnapshot.data.error){
                      print('error atas');
                      Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }else{
                      print('error bawah');
                    }
              });
            }

//            snapshot.hasData
//                ? bloc.submit
//                : null
//            ,
          }

        );
      },
    );
  }
}