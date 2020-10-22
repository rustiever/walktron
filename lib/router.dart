import 'package:get/get.dart';

import 'bindings/bindings.dart';
import 'controllers/controllers.dart';
import 'views/views.dart';

const String loginRoute = '/';
const String homeroute = '/home';
const String splashroute = 'splash';
const String errorroute = 'error';
const String signUpRoute = 'signUp';
const String profileRoute = 'profile';

List<GetPage> routes() {
  return [
    GetPage(
      name: profileRoute,
      page: () => ProfileView(),
    ),
    GetPage(name: loginRoute, page: () => LoginView(), binding: AuthBinding()),
    GetPage(
        name: signUpRoute, page: () => SignUpView(), binding: AuthBinding()),
    GetPage(
      name: homeroute,
      page: () => HomeView(),
      bindings: [
        AuthBinding(),
        BindingsBuilder.put(() => BluetoothController())
      ],
    ),
  ];
}
