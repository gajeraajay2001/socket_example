import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'Constants/api_constants.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/modules/message_screen/controllers/message_screen_controller.dart';

class SocketController extends GetxController {
  RxList<UserData> userDataList = RxList<UserData>([]);
  RxList<MessageModel> messageDataList = RxList<MessageModel>([]);

  IO.Socket? socket;
  @override
  void onInit() {
    initSocket();
    super.onInit();
  }

  initSocket() {
    socket = IO.io(ApiConstant.socketServerUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket!.connect();
    socket!.onConnect((value) {
      print(value);
      print('Connection established');
    });
    socket!.on(ArgumentConstant.onUserInfoReceived, (data) {
      userDataList.add(UserData(
          profilePic: data["profilePic"].toString(),
          messageData: RxList<MessageModel>([]),
          userId: data["userId"].toString()));
      print(data["profilePic"]);
    });
    socket!.on(ArgumentConstant.onMessageReceived, (data) {
      messageDataList.add(MessageModel(
          userId: data[0]["userId"].toString(),
          profilePic: data[0]["profilePic"].toString(),
          message: data[1].toString()));
      // }
    });
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print(err));
    socket!.onError((err) => print(err));
  }
}

class UserData {
  String? profilePic;
  String? userId;
  RxList<MessageModel> messageData = RxList<MessageModel>([]);
  UserData({this.userId, this.profilePic, required this.messageData});
}

class MessageModel {
  String? message;
  String? userId;
  String? profilePic;
  MessageModel({this.message, this.userId, this.profilePic});
}
