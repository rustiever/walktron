import 'package:get/get.dart';
import 'bindings/bindings.dart';
import 'views/views.dart';

const String authroute = '/';
const String homeroute = '/home';
const String splashroute = 'splash';
const String errorroute = 'error';

List<GetPage> routes() {
  return [
    // GetPage(
    //   name: errorroute,
    //   page: () => ErrorScreen(),
    // ),
    GetPage(name: authroute, page: () => LoginView(), binding: AuthBinding()),
    GetPage(
      name: homeroute,
      page: () => HomeView(),
      bindings: [
        // AuthBinding(),
        // BindingsBuilder(() => {Get.lazyPut(() => PagesController())}),
        // HomeBinding()
      ],
    ),
  ];
}
