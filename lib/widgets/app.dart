import 'package:flutter/material.dart';
import 'package:login_bloc/widgets/screens/login_screen.dart';

import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
