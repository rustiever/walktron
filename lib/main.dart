import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:walktron/router.dart';

// void main() {
//   init();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => Walktorn(),
//     ),
//   );
// }

Future<void> main() async {
  await init();
  runApp(Walktorn());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
}

class Walktorn extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Walktron',
      initialRoute: authroute,
      getPages: routes(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
