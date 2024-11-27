part of 'register_bloc.dart';

 class RegisterState {
   final String firstName;
    final String lastName;
    final String phoneNumber;
   DateTime? dateOfBirth;
    final GroupModel? groups;
    final GroupModelDatum? groupSelected;
    final double numberFields;
    final bool isLoading;
    final bool isNextStepLoading;
     Map<String, dynamic> result;
    final String password;
    final String confirmPassword;
    final String otp;

    RegisterState({
      this.firstName = "",
      this.lastName = "",
      this.phoneNumber = "",
      this.dateOfBirth,
      this.groups,
      this.numberFields = 0,
      this.groupSelected,
      this.isLoading = false,
      this.isNextStepLoading = false,
      this.result = const {},
      this.password = "",
      this.confirmPassword = "",
      this.otp = "",
    });


    RegisterState copyWith({
      String? firstName,
      String? lastName,
      String? phoneNumber,
      DateTime? dateOfBirth,
      GroupModel? groups,
      GroupModelDatum? groupSelected,
      Map<String, dynamic>? result,

      double? numberFields,
      bool? isNextStepLoading,
      bool? isLoading,
      String? password,
      String? confirmPassword,
      String? otp,
    }) {
      return RegisterState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        groups: groups ?? this.groups,
        numberFields: numberFields ?? this.numberFields,
        groupSelected: groupSelected ?? this.groupSelected,
        isLoading: isLoading ?? this.isLoading,
        result: result ?? this.result,
        isNextStepLoading: isNextStepLoading ?? this.isNextStepLoading,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        otp: otp ?? this.otp,
      );
    }

 }

