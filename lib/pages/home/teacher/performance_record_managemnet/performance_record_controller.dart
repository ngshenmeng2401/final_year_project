import 'package:final_year_project/model/listening_record.dart';
import 'package:final_year_project/model/reading_record.dart';
import 'package:final_year_project/model/speaking_record.dart';
import 'package:final_year_project/model/writing_record.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/edit_record/listening_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/edit_record/reading_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/edit_record/speaking_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/edit_record/writing_questions.dart';
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

  late TextEditingController searchRecordController = new TextEditingController();

  late String className;

  List<String> sortingList = [
    "Default",
    "idD",
    "nameA",
    "nameD",
  ];
  var selectSorting = "Default";
  
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

        var listeningRecord = await HomeRemoteServices.fetchListeningRecord(className, "load", "a", "a");
        if (listeningRecord != null) {
          listeningRecordList.assignAll(listeningRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "reading"){

        var readingRecord = await HomeRemoteServices.fetchReadingRecord(className, "load", "a", "a");
        if (readingRecord != null) {
          readingRecordList.assignAll(readingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "speaking"){

        var speakingRecord = await HomeRemoteServices.fetchSpeakingRecord(className, "load", "a", "a");
        if (speakingRecord != null) {
          speakingRecordList.assignAll(speakingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "writing"){

        var writingRecord = await HomeRemoteServices.fetchWritingRecord(className, "load", "a", "a");
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

    listeningRecordList.clear();
    readingRecordList.clear();
    speakingRecordList.clear();
    writingRecordList.clear();

    String category = appData.read("category")??'';
    String className = appData.read("className")??'';
    String searchText = searchRecordController.text.toString();

    try {
      isLoading(true);

      if(category == "listening"){

        var listeningRecord = await HomeRemoteServices.fetchListeningRecord(className, "search", searchText, "a");
        if (listeningRecord != null) {
          listeningRecordList.assignAll(listeningRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "reading"){

        var readingRecord = await HomeRemoteServices.fetchReadingRecord(className, "search", searchText, "a");
        if (readingRecord != null) {
          readingRecordList.assignAll(readingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "speaking"){

        var speakingRecord = await HomeRemoteServices.fetchSpeakingRecord(className, "search", searchText, "a");
        if (speakingRecord != null) {
          speakingRecordList.assignAll(speakingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "writing"){

        var writingRecord = await HomeRemoteServices.fetchWritingRecord(className, "search", searchText, "a");
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

  Future<void> sortRecord(String sortValue) async {

    String category = appData.read("category")??'';
    String className = appData.read("className")??'';

    try {
      isLoading(true);

      if(category == "listening"){

        var listeningRecord = await HomeRemoteServices.fetchListeningRecord(className, "sort", "a", sortValue);
        if (listeningRecord != null) {
          listeningRecordList.assignAll(listeningRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "reading"){

        var readingRecord = await HomeRemoteServices.fetchReadingRecord(className, "sort", "a", sortValue);
        if (readingRecord != null) {
          readingRecordList.assignAll(readingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "speaking"){

        var speakingRecord = await HomeRemoteServices.fetchSpeakingRecord(className, "sort", "a", sortValue);
        if (speakingRecord != null) {
          speakingRecordList.assignAll(speakingRecord);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "writing"){

        var writingRecord = await HomeRemoteServices.fetchWritingRecord(className, "sort", "a", sortValue);
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

  void sortRecordDialog(){

    Get.defaultDialog(
      
      title: "Sort by:".tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<PerformanceRecordController>(
            init: PerformanceRecordController(),
            builder: (controller) {
              return ListTile(
                title: Text("Default".tr),
                trailing: Radio(
                    value: sortingList[0],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<PerformanceRecordController>(
            init: PerformanceRecordController(),
            builder: (controller) {
              return ListTile(
                title: Text("Student Id with Descending Order".tr),
                trailing: Radio(
                    value: sortingList[1],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<PerformanceRecordController>(
            init: PerformanceRecordController(),
            builder: (controller) {
              return ListTile(
                title: Text("Name with Ascending Order".tr),
                trailing: Radio(
                    value: sortingList[2],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<PerformanceRecordController>(
            init: PerformanceRecordController(),
            builder: (controller) {
              return ListTile(
                title: Text("Name with Descending Order".tr),
                trailing: Radio(
                    value: sortingList[3],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
        ],
      ),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm: () {
        Get.back();
        sortRecord(selectSorting);
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void clickSorting(value) {
    selectSorting = value;
    // print(selectSorting);
    update();
  }

  void deleteRecordDialog(String category, String studentId){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        HomeRemoteServices.deleteRecord(category, studentId),
        listeningRecordList.clear(),
        readingRecordList.clear(),
        speakingRecordList.clear(),
        writingRecordList.clear(),
        Future.delayed(const Duration(milliseconds: 1000), () {
          loadRecordList();
        }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
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
  }

  void navigateEditListeningRecord(ListeningRecord listeningRecord){

    Get.to(() => EditListeningQuestions(listeningRecord))!.then((value) => loadRecordList());
  }

  void navigateEditReadingRecord(ReadingRecord readingRecord){

    Get.to(() => EditReadingQuestions(readingRecord))!.then((value) => loadRecordList());
  }

  void navigateEditSpeakingRecord(SpeakingRecord speakingRecord){

    Get.to(() => EditSpeakingQuestions(speakingRecord))!.then((value) => loadRecordList());
  }

  void navigateEditWritingRecord(WritingRecord writingRecord){

    Get.to(() => EditWritingQuestions(writingRecord))!.then((value) => loadRecordList());
  }
}