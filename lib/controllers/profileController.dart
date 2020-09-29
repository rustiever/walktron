import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walktron/repository.dart';

class ProfileController extends GetxController {
  final Repository repository;
  ProfileController({@required this.repository}) : assert(repository != null);
  static ProfileController to = Get.find();
  TextEditingController name;
  TextEditingController height;
  TextEditingController weight;
  TextEditingController age;

  RxBool nameEnable = false.obs,
      heightEnable = false.obs,
      wieghtEnable = false.obs,
      ageEnable = false.obs;

  @override
  void onInit() {
    name = TextEditingController();
    height = TextEditingController();
    weight = TextEditingController();
    age = TextEditingController();
    super.onInit();
  }

  @override
  FutureOr onClose() {
    name.dispose();
    height.dispose();
    weight.dispose();
    age.dispose();
    return super.onClose();
  }
}
