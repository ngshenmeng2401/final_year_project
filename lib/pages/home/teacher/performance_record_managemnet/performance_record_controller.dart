import 'package:final_year_project/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PerformanceRecordController extends GetxController{

  final appData = GetStorage();
  var isSearching = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  List<String> categoryList = [
    "Listening",
    "Reading",
    "Speaking",
    "Writing",
  ];
  var selectCategory = "Listening";

  late TextEditingController searchRecordController = new TextEditingController();

  final List<String> studentName = [
    "Lim Jun Jie",
    "Jay Chou",
    "Emma Stone",
    "Ahmad",
    "Ng Shen Meng",
    "Akmal Hanis",
    "Steve Rogers",
  ];
  var selectName = 'Lim Jun Jie';

  late String className;
  
  @override
  void onInit() {

    super.onInit();

  }

  Future<void> searchRecord() async {

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

    searchRecordController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchRecordController.clear();
    isSearching.value = false;
    // productList.clear();
    statusMsj("Search_Product".tr);
  }

  void navigateAddDialog(){

    Get.defaultDialog(
      
      title: "Categories:".tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: Colors.grey[100],
            // leading: Text("1."),
            title: Text("Listening".tr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.ListeningQuestionsPage);
            },
          ),
          SizedBox(height: 5),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: Colors.grey[100],
            // leading: Text("2."),
            title: Text("Reading".tr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.ReadingQuestionsPage);
            },
          ),
          SizedBox(height: 5),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: Colors.grey[100],
            // leading: Text("3."),
            title: Text("Speaking".tr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.SpeakingQuestionsPage);
            },
          ),
          SizedBox(height: 5),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: Colors.grey[100],
            // leading: Text("4."),
            title: Text("Writing".tr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.WritingQuestionsPage);
            },
          )
        ],
      ),
      textConfirm: null,
      textCancel: null,
      // onConfirm: () {
      //   Get.back();
      //   sortStudent(selectSorting);
      // },
      // cancelTextColor: Colors.black,
      // confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateAddRecordView(){

    Get.toNamed(AppRoutes.AddRecordDetailsPage);
  }

  void chooseStudent(value){
     selectName = value;
     print(selectName);
     update();
  }
}