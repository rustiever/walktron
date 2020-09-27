import 'package:get/get.dart';
import 'package:walktron/controllers/controllers.dart';
import 'package:walktron/services/firebaseServices.dart';

import '../repository.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() {
      Get.put(FirebaseService(), permanent: true);
      Get.put(Repository(Get.find()), permanent: true);
      return Get.put(AuthController(repository: Get.find()));
    });
  }
}
