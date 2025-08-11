
import 'package:clean_archi/util/Routes/route_strings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    await Future.delayed(Duration(seconds: 2));
    checkInternet();
    super.onInit();
  }

  Future<void> checkInternet() async {
    List<ConnectivityResult> connectionResult =
        await Connectivity().checkConnectivity();
    if (connectionResult.contains(ConnectivityResult.mobile) ||
        connectionResult.contains(ConnectivityResult.wifi)) {
      checkNotifications();
    } else {
      Get.snackbar(
        "Error",
        "No wifi connection",
        duration: Duration(days: 1),
        mainButton: TextButton(
          onPressed: () {
            Get.back();
            checkInternet();
          },
          child: Text("Retry"),
        ),
      );
    }
  }

  Future<void> checkNotifications() async {
    await Permission.notification.request();

    Get.offAndToNamed(RouteStrings.welcome);
  }
}
