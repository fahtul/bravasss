import 'package:flutter/material.dart';
import 'package:login_with_localapi/src/ui/login.dart';

import 'blocs/validator_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginBlocProvider(
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Login(),
        ),
      ),
    );
  }
}
