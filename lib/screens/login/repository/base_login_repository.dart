abstract class BaseLoginRepository {
  Future<void> login(String phoneNumber, String password);

  Future<void> logout();

  Future storeFcmToken(String token);

  Future forgotPasswordGetOTP({required String phoneNumber});

  Future forgotPasswordVerifyOTP({
    required String phoneNumber,
    required String otp,
  });

  Future forgotPasswordChangePassword({
    required String tel,
    required String newPassword,
    required String newPasswordConfirm,
  });
}
