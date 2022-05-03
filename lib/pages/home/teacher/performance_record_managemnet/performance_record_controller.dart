import 'package:final_year_project/model/listening_record.dart';
import 'package:final_year_project/model/reading_record.dart';
import 'package:final_year_project/model/speaking_record.dart';
import 'package:final_year_project/model/writing_record.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PerformanceRecordController extends GetxController{

  final appData = GetStorage();
  var isSearching = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var listeningRecordList = <ListeningRecord>[].obs;
  var readingRecordList = <ReadingRecord>[].obs;
  var speakingRecordList = <SpeakingRecord>[].obs;
  var writingRecordList = <WritingRecord>[].obs;

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
    loadRecordList();
  }

  void loadRecordList() async{

    String category = appData.read("category")??'';
    String className = appData.read("className")??'';

    print(category);
    print(className);

    try {
      isLoading(true);

      if(category == "listening"){

        var listeningRecord = await HomeRemoteServices.fetchListeningRecord(className, "load", "a");
        if (listeningRecord != null) {
          listeningRecordList.assignAll(listeningRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "reading"){

        var readingRecord = await HomeRemoteServices.fetchReadingRecord(className, "load", "a");
        if (readingRecord != null) {
          readingRecordList.assignAll(readingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "speaking"){

        var speakingRecord = await HomeRemoteServices.fetchSpeakingRecord(className, "load", "a");
        if (speakingRecord != null) {
          speakingRecordList.assignAll(speakingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "writing"){

        var writingRecord = await HomeRemoteServices.fetchWritingRecord(className, "load", "a");
        if (writingRecord != null) {
          writingRecordList.assignAll(writingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }  

    } finally {
      isLoading(false);
    }
    
  }

  Future<void> searchRecord() async {

    String category = appData.read("category")??'';
    String className = appData.read("className")??'';
    String searchText = searchRecordController.text.toString();

    try {
      isLoading(true);

      if(category == "listening"){

        var listeningRecord = await HomeRemoteServices.fetchListeningRecord(className, "search", searchText);
        if (listeningRecord != null) {
          listeningRecordList.assignAll(listeningRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "reading"){

        var readingRecord = await HomeRemoteServices.fetchReadingRecord(className, "search", searchText);
        if (readingRecord != null) {
          readingRecordList.assignAll(readingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "speaking"){

        var speakingRecord = await HomeRemoteServices.fetchSpeakingRecord(className, "search", searchText);
        if (speakingRecord != null) {
          speakingRecordList.assignAll(speakingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "writing"){

        var writingRecord = await HomeRemoteServices.fetchWritingRecord(className, "search", searchText);
        if (writingRecord != null) {
          writingRecordList.assignAll(writingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }  

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

    String category = appData.read("category")??'';

    if(category == "listening"){

      Get.toNamed(AppRoutes.ListeningQuestionsPage)!.then((value) => loadRecordList());

    }else if(category == "reading"){

      Get.toNamed(AppRoutes.ReadingQuestionsPage)!.then((value) => loadRecordList());

    }else if(category == "speaking"){

      Get.toNamed(AppRoutes.SpeakingQuestionsPage)!.then((value) => loadRecordList());

    }else if(category == "writing"){

      Get.toNamed(AppRoutes.WritingQuestionsPage)!.then((value) => loadRecordList());

    }

    // Get.defaultDialog(
      
    //   title: "Categories:".tr,
    //   content: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       ListTile(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         tileColor: Colors.grey[100],
    //         // leading: Text("1."),
    //         title: Text("Listening".tr),
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //         onTap: () {
    //           Get.back();
    //           Get.toNamed(AppRoutes.ListeningQuestionsPage);
    //         },
    //       ),
    //       SizedBox(height: 5),
    //       ListTile(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         tileColor: Colors.grey[100],
    //         // leading: Text("2."),
    //         title: Text("Reading".tr),
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //         onTap: () {
    //           Get.back();
    //           Get.toNamed(AppRoutes.ReadingQuestionsPage);
    //         },
    //       ),
    //       SizedBox(height: 5),
    //       ListTile(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         tileColor: Colors.grey[100],
    //         // leading: Text("3."),
    //         title: Text("Speaking".tr),
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //         onTap: () {
    //           Get.back();
    //           Get.toNamed(AppRoutes.SpeakingQuestionsPage);
    //         },
    //       ),
    //       SizedBox(height: 5),
    //       ListTile(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         tileColor: Colors.grey[100],
    //         // leading: Text("4."),
    //         title: Text("Writing".tr),
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //         onTap: () {
    //           Get.back();
    //           Get.toNamed(AppRoutes.WritingQuestionsPage);
    //         },
    //       )
    //     ],
    //   ),
    //   textConfirm: null,
    //   textCancel: null,
    //   buttonColor: Colors.black,
    // );
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