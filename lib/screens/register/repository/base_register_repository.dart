class BaseRegisterRepository {
  Future<void> sendOTP(String phoneNumber) async {}

  Future<void> verifyOTP(String phoneNumber, String otp) async {}

  Future<void> getGroups() async {}

  Future<void> register({
    required String groupId,
    required String firstName,
    required String lastName,
    required String tel,
    required String dateOfBirth,
    required String numberFields,
    required String password,
    required String confirmPassword,
    required bool isAcceptTerms,
  }) async {}
}
