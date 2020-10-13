import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:walktron/router.dart';

// Future<void> main() async {
//   await init();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => Walktron(),
//     ),
//   );
// }

Future<void> main() async {
  await init();
  runApp(Walktron());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
}

class Walktron extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walktron',
      initialRoute: loginRoute,
      getPages: routes(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
