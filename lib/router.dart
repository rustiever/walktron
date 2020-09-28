import 'package:get/get.dart';
import 'bindings/bindings.dart';
import 'views/views.dart';

const String loginRoute = '/';
const String homeroute = '/home';
const String splashroute = 'splash';
const String errorroute = 'error';
const String signUpRoute = 'signUp';

List<GetPage> routes() {
  return [
    // GetPage(
    //   name: errorroute,
    //   page: () => ErrorScreen(),
    // ),
    GetPage(name: loginRoute, page: () => LoginView(), binding: AuthBinding()),
    GetPage(
        name: signUpRoute, page: () => SignUpView(), binding: AuthBinding()),
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
