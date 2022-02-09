import 'package:final_year_project/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentManagementController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchChildrenController = new TextEditingController();
  late TextEditingController parentIDController = new TextEditingController();
  late TextEditingController phoneNoController = new TextEditingController();

  // var productList = <Product>[].obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  List<String> studentName = [
    "Lim Jun Jie",
    "Jay Chou",
    "Emma Stone",
    "Ahmad",
    "Ng Shen Meng",
    "Akmal Hanis",
    "Steve Rogers",
    "Lim Jun Jie",
    "Jay Chou",
    "Emma Stone",
    "Ahmad",
    "Ng Shen Meng",
    "Akmal Hanis",
    "Steve Rogers",
  ];

  Future<void> searchChildren() async {

    // searchProductController.text = "Bake";

    try {
      isLoading(true);
      // var products = await ProductRemoveService.searchProduct(searchProductController.text.toString());
      // if (products != null) {
      //   productList.assignAll(products);
      //   searchResult.value = true;
      // } else {
      //   searchResult.value = false;
      //   statusMsj("Not_Found".tr);
      // }
    } finally {
      isLoading(false);
    }
  }

  void checkTextField(){

    searchChildrenController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchChildrenController.clear();
    isSearching.value = false;
    // productList.clear();
    statusMsj("Search_Product".tr);
  }

  void navigateAddStudentView(){

    Get.toNamed(AppRoutes.AddStudentDetailsPage);
  }

  void addChildren(){

    Get.defaultDialog(
      title: "Please_key_in:".tr,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,15,0),
            child: TextField(
              controller: parentIDController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Parent_IC".tr
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,10,15,0),
            child: TextField(
              controller: phoneNoController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Phone_No".tr
              ),
            ),
          ),
        ],
      ),
      textConfirm: "Submit".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => checkAddChildren() ,
      onCancel: () => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void checkAddChildren(){

    String parentID = parentIDController.text.toString();
    String phoneNo = phoneNoController.text.toString();

    if(parentID.isEmpty){

      Get.snackbar(
        "Error".tr,"ParentIC_is_Empty".tr,
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if(phoneNo.isEmpty){

      Get.snackbar(
        "Error".tr,"PhoneNo_is_Empty".tr,
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if(phoneNo.isEmpty && parentID.isEmpty){

      Get.snackbar(
        "Error".tr,"Please_complete_all_field".tr,
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else{

      Get.back();
      Get.snackbar(
        "Message".tr,"Add_Children_Successful".tr,
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      
    }
  }
}