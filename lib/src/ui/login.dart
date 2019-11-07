import 'package:flutter/material.dart';
import 'package:login_with_localapi/src/blocs/validator_provider.dart';
import 'package:login_with_localapi/src/models/login_model.dart';
import 'package:login_with_localapi/src/models/response_login_model.dart';
import 'package:login_with_localapi/src/ui/home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final bloc = LoginBlocProvider.of(context);
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
              errorText: snapshot.error),
          obscureText: true,
        );
      },
    );
  }


  Widget submitButton(bloc) {
    return StreamBuilder(
        stream: bloc.statusLogin,
        builder: (context, AsyncSnapshot<bool> snapshotLogin) {
          return StreamBuilder(
            stream: bloc.submitValid,
            builder: (context, AsyncSnapshot<bool> snapshotSubmit) {
              return RaisedButton(
                child: Text('Login'),
                color: Colors.blue[700],
                textColor: Colors.white,
                onPressed: () =>
                {
                  print('klik buttom'),
                  bloc.submit(),
                  print(snapshotLogin.hasData.toString())
//                  if(snapshotLogin.data ==true){
//                    print('Halo')
//                  }else{
//                    print('Halo 2')
//                  }

                },
//            {
//              if(snapshot.hasData){
//                  if(bloc.statusLogin){
//                    print('Berhasil Login')
//                  }else{
//                    print('Gagal Login')
//                  }
//              }
//            }
              );
//                  if (snapshot.hasData)
//                    {
//                      print('hasdta'),
//                      bloc.submit(),
//                      StreamBuilder<ResponseLogin>(
//                        stream: bloc.loginPostResponse,
//                        builder: (BuildContext context,
//                            AsyncSnapshot<ResponseLogin> snapshot) {
//                          print(snapshot);
//                          if (snapshot.data.error) {
//                            return Text('errr');
//                          } else {
//                            return Text('not error');
//                          }
//                        },
//                      ),
//                    }
//                  else
//                    {print('dont has')}

            },
          );
        }

    );
  }

  openDetailPage() {}
}

checkLogin(AsyncSnapshot<ResponseLogin> snapshot) {
  print('jalan cuy');
  if (snapshot.data.error) {
    print('error coy');
  } else {
    print('gk error cuy');
  }
}
