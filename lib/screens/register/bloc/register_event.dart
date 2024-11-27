part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterInitialEvent extends RegisterEvent {}

class RegisterFirstNameChanged extends RegisterEvent {
  final String firstName;

  RegisterFirstNameChanged(this.firstName);
}

class RegisterLastNameChanged extends RegisterEvent {
  final String lastName;

  RegisterLastNameChanged(this.lastName);
}

class RegisterPhoneNumberChanged extends RegisterEvent {
  final String phoneNumber;

  RegisterPhoneNumberChanged(this.phoneNumber);
}

class RegisterDateOfBirthChanged extends RegisterEvent {
  final DateTime dateOfBirth;

  RegisterDateOfBirthChanged(this.dateOfBirth);
}

class RegisterGroupSelectedChanged extends RegisterEvent {
  final GroupModelDatum groupSelected;

  RegisterGroupSelectedChanged(this.groupSelected);
}

class RegisterNumberFieldsChanged extends RegisterEvent {
  final double numberFields;

  RegisterNumberFieldsChanged(this.numberFields);
}

class RegisterLoading extends RegisterEvent {
  final bool isLoading;

  RegisterLoading(this.isLoading);
}

class RegisterNext extends RegisterEvent {
  final BuildContext context;

  RegisterNext(this.context);
}

class RegisterOTPChanged extends RegisterEvent {
  final String otp;

  RegisterOTPChanged(this.otp);
}

class RegisterConfirmOTP extends RegisterEvent {
  final String otp;
  final BuildContext context;

  RegisterConfirmOTP(this.otp, this.context);
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged(this.password);
}

class RegisterConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;

  RegisterConfirmPasswordChanged(this.confirmPassword);
}

class RegisterSubmit extends RegisterEvent {
  final BuildContext context;
  final bool isAcceptTerms;

  RegisterSubmit(this.context, this.isAcceptTerms);
}
