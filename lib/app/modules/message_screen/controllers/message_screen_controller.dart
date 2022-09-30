import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:socet_test/Constants/api_constants.dart';
import 'package:socet_test/socetController.dart';

class MessageScreenController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  SocketController? socketController;
  String userId = "";

  @override
  void onInit() {
    if (Get.arguments != null) {
      userId = Get.arguments[ArgumentConstant.userId];
      Get.lazyPut(() => SocketController);
      socketController = Get.find<SocketController>();
    }
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
