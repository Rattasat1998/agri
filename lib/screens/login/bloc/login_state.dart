part of 'login_bloc.dart';

class LoginState {
  final String phoneNumber;
  final String password;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String errorMessage;
  final bool obscureText;

  LoginState({
    this.phoneNumber = '',
    this.password = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorMessage = '',
    this.obscureText = true,
  });

  LoginState copyWith({
    String? phoneNumber,
    String? password,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    bool? obscureText,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage ?? this.errorMessage,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
