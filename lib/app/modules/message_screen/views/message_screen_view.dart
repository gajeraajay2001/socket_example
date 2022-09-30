import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Constants/api_constants.dart';
import '../../../../socetController.dart';
import '../controllers/message_screen_controller.dart';

class MessageScreenView extends GetWidget<MessageScreenController> {
  const MessageScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MessageScreenView'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: getImageByLink(
                              url: controller.socketController!
                                  .messageDataList[index].profilePic
                                  .toString(),
                              height: 100,
                              width: 100),
                        ),
                        title: Text(controller
                            .socketController!.messageDataList[index].message
                            .toString()),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount:
                        controller.socketController!.messageDataList.length),
              ),
              TextFormField(
                  controller: controller.textEditingController,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {
                          controller.socketController!.socket!
                              .emit(ArgumentConstant.message, [
                            controller
                                .socketController!.messageDataList[0].userId
                                .toString(),
                            controller.textEditingController.text
                          ]);
                        },
                        child: Icon(Icons.send)),
                  )),
            ],
          ),
        );
      }),
    );
  }
}
