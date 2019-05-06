import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest([email, password], (_) => true);

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  void submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('email: $validEmail | password: $validPassword');
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}