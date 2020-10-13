import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:walktron/models/models.dart';
import '../repository.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final Repository repository;
  AuthController({@required this.repository}) : assert(repository != null);
  UserModel user;
  TextEditingController email;
  TextEditingController pass;
  final passVisible = true.obs;

  @override
  void onInit() {
    user = _getUser();
    email = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  @override
  FutureOr onClose() {
    email.dispose();
    pass.dispose();
    return super.onClose();
  }

  UserModel _getUser() => repository.getUser();

  void signUp() => repository.signUp(email.text, pass.text);

  void googleSignIn() => repository.googleSignIn();

  void login() {
    repository.login(email.text, pass.text);
    print(email.text);
    print(user);
  }

  void logout() => repository.logout();
}
