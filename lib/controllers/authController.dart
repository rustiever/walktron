import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../repository.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final Repository repository;
  AuthController({@required this.repository}) : assert(repository != null);
  TextEditingController email;
  TextEditingController pass;

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  Future<void> login() async {
    final user = await repository.login(email.text, pass.text);
    // LocalService.instance.save(UserModel(name: null, uid: null, height: null, weight: null))
    print(user);
  }
}
