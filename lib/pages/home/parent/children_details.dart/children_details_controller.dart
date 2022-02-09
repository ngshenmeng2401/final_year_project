import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildrenDetailsController extends GetxController{

  void confirmResult(){

    Get.defaultDialog(
      title: "Please_key_in:".tr,
      content: Column(),
      textConfirm: "Submit".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => Get.back(),
      onCancel: () => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }
}