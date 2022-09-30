import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socet_test/Constants/api_constants.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: controller.socketController!.userDataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      controller.socketController!.userDataList[index].userId!),
                  onTap: () {
                    Get.toNamed(Routes.MESSAGE_SCREEN, arguments: {
                      ArgumentConstant.userId: controller
                          .socketController!.userDataList[index].userId,
                    });
                  },
                  leading: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: getImageByLink(
                        url: controller
                            .socketController!.userDataList[index].profilePic!,
                        height: 100,
                        width: 100),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.socketController!.socket!
                .emit(ArgumentConstant.createUser, ArgumentConstant.createUser);
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
