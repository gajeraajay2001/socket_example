import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/message_screen/bindings/message_screen_binding.dart';
import '../modules/message_screen/views/message_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_SCREEN,
      page: () => const MessageScreenView(),
      binding: MessageScreenBinding(),
    ),
  ];
}
