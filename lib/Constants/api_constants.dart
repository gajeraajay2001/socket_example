import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ApiConstant {
  static String socketServerUrl = "http://15.206.117.247/";
}

class ArgumentConstant {
  static String createUser = "createUser";
  static String onUserInfoReceived = "onUserInfoReceived";
  static String onMessageReceived = "onMessageReceived";
  static String message = "message";
  static String userId = "userId";
}

CachedNetworkImage getImageByLink(
    {required String url,
    required double height,
    required double width,
    bool isLoading = false,
    bool colorFilter = false,
    BoxFit boxFit = BoxFit.contain}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: boxFit,
          colorFilter: (colorFilter)
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken)
              : null,
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height: 30,
      width: 30,
      child: LinearProgressIndicator(
        color: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade100,
      ),
    ),
    errorWidget: (context, url, error) =>
        Image(image: AssetImage("assets/user_image.png")),
  );
}
