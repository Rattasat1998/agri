import 'package:agri/screens/profile/models/profile_model.dart';

abstract class BaseProfileRepository {
  Future<PModel> getProfile();

  Future editFirstName({required String firstname});

  Future editLastName({required String lastname});

  Future editDateOfBirth({required String dateOfBirth});

  Future changeProfile({required String profileImg});

  Future closeAccount({required String password});

  Future restoreAccount({required String restoreToken});
}
