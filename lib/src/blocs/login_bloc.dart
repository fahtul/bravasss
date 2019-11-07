
import 'package:login_with_localapi/src/blocs/validator.dart';
import 'package:http/http.dart' as http;
import 'package:login_with_localapi/src/models/login_model.dart';
import 'package:login_with_localapi/src/models/response_login_model.dart';
import 'package:login_with_localapi/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Validators {

  final _email = BehaviorSubject<String>();
  final _statusLogin = PublishSubject<bool>();
  final _password = BehaviorSubject<String>();
  final _responseLogin = PublishSubject<ResponseLogin>();
  final _loginPost = PublishSubject<LoginPost>();
  final _uid = BehaviorSubject<String>();



  final _repository = Repository();


  // ignore: close_sinks
//  final _loginPost = BehaviorSubject<LoginPost>();


  // retrieve data from stream
  Observable<String> get email => _email.stream.transform(validateEmail);
  Observable<String> get password => _password.stream.transform(validatePassword);
  Observable<String> get uid => _uid.stream;
  Observable<ResponseLogin> get loginPostResponse => _responseLogin.stream;
  Observable<LoginPost> get loginPost => _loginPost.stream;
  Observable<bool> get statusLogin => _statusLogin.stream;

  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e,p) => true);

  //add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
//  Function(ResponseLogin) get responseLogin => _responseLogin.sink.add;
//  Function(LoginPost) get loginPostGet => _loginPost.sink.add;
//  Function(String) get uid => _loginPost.sink.add;
//  Function(bool) get sta => _loginPost.sink.add;

  submit() async{
    final validEmail = _email.value;
    final validPassword = _password.value;

    LoginPost loginPost = LoginPost(email: _email.value, password: _password.value);
    ResponseLogin responseLogin = await _repository.login(loginPost);
    _responseLogin.sink.add(responseLogin);
//    print('$validEmail and $validPassword and $responseLogin and ');
//    print("onTap");

//    final statusLo = responseLogin.error;



//    if(responseLogin.error){
//      print('jalan bro bro');
////      _statusLogin.sink.add(statusLo);
//    }else{
//      print('jalan bro bro else');
////      _statusLogin.sink.add(statusLo);
//    }




  }

  checkStatus() {
    if(_responseLogin != null){
      
    }
  }

  dispose(){
    _email.close();
    _password.close();
    _responseLogin.close();
    _statusLogin.close();
  }


}

//final bloc = LoginBloc();