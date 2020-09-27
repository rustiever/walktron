import 'package:get_storage/get_storage.dart';

import '../models/models.dart';

class LocalService {
  LocalService._private();
  static LocalService instance = LocalService._private();
  GetStorage box = GetStorage();
  Future<void> save(UserModel user) async {
    await box.write('user', user);
  }

  UserModel getUser() {
    final UserModel user = box.read('user');
    if (user != null) {
      return user;
    }
    return null;
  }
}
