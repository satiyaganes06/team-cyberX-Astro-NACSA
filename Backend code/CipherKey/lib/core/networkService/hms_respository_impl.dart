import 'package:cipherkey/presentation/widget/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:huawei_safetydetect/huawei_safetydetect.dart';

import 'hms_respository.dart';

class HmsRepositoryImpl extends HmsRepository {
  late final String appId;

  @override
  Future<void> initUrlCheck() async {
    // SafetyDetect.getAppID.then((String appId) async{
    //   this.appId = appId;
    //   debugPrint('getAppID ' + 'App Id: $appId');

    //   await SafetyDetect.initUrlCheck();
    //   await SafetyDetect.initUserDetect();

    // }).catchError((dynamic e) {
    //   Get.snackbar('Platform Error', 'Please install HMS Core on your device', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white, duration: const Duration(seconds: 10));

    // });
  }

  @override
  Future<dynamic> shutdownUrlCheck() async {
    //return await SafetyDetect.shutdownUrlCheck();
  }

  @override
  Future<dynamic> urlCheck(String url) async {
    // final List<UrlCheckThreat> result = await SafetyDetect.urlCheck(
    //   url,
    //   appId,
    //   <UrlThreatType>[
    //     UrlThreatType.malware,
    //     UrlThreatType.phishing,
    //   ],
    // );
    // return result;
  }

  @override
  Future<void> initUserDetect() async {
    // return await SafetyDetect.initUserDetect();
  }

  @override
  Future<dynamic> shutdownUserDetect() async {
    // return await SafetyDetect.shutdownUserDetect();
  }

  @override
  Future<String?> userDetection() async {
    // try {
    //   final String? token = await SafetyDetect.userDetection(appId);
    //   return token;
    // } catch (e) {
    //   return null;
    // }
  }
}
