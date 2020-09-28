import 'package:get_storage/get_storage.dart';

import '../models/models.dart';

class LocalService {
  LocalService._private();
  static LocalService instance = LocalService._private();
  final GetStorage _box = GetStorage();
  Future<void> clearLocalData() async {
    await _box.erase();
  }

  Future<void> save(UserModel user) async {
    await _box.write('user', user.toJson());
    print(_box.read('user'));
    print(getUser());
  }

  UserModel getUser() {
    final Map<String, dynamic> user = _box.read('user');
    print('${user}null');
    if (user != null) {
      print(user);
      return UserModel.fromJson(user);
    }
    return null;
  }
}
