part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginPhoneNumberChanged extends LoginEvent {
  final String phoneNumber;

  LoginPhoneNumberChanged(this.phoneNumber);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
}

class LoginObscureText extends LoginEvent {
  final bool obscureText;

  LoginObscureText(this.obscureText);
}

class LoginSubmitted extends LoginEvent {
  final BuildContext context;

  LoginSubmitted(this.context);
}
