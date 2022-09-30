import 'package:get/get.dart';
import 'package:socet_test/Constants/api_constants.dart';
import 'package:socet_test/socetController.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeController extends GetxController {
  SocketController? socketController;
  @override
  void onInit() {
    Get.lazyPut<SocketController>(() => SocketController());
    socketController = Get.find<SocketController>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
