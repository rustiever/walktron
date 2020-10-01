import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AddDevicesController extends GetxController {
  static AddDevicesController to = Get.find();
  AnimationController animationController;

  // @override
  // void onInit() {
  //   //  animationController = AnimationController( vsync: ,);
  //   super.onInit();
  // }

  @override
  FutureOr onClose() {
    animationController.dispose();
    return super.onClose();
  }
}
