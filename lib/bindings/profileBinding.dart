import 'package:get/get.dart';
import 'package:walktron/controllers/controllers.dart';

import '../repository.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() {
      // Get.put(FirebaseService(), permanent: true);
      Get.put(Repository(Get.find()));
      return Get.put(ProfileController(repository: Get.find()));
    });
  }
}
