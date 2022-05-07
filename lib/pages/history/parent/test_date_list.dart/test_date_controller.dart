import 'dart:async';

import 'package:final_year_project/model/children_test_record.dart';
import 'package:final_year_project/service/parent/history_remote_services.dart';
import 'package:get/get.dart';

class TestDateController extends GetxController{

  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var testRecordList = <ChildrenTestRecord>[].obs;
  late Timer? timer;

  @override
  void onInit() {

    super.onInit();
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadClassroomList());
    loadTestRecordList();
  }

  void loadTestRecordList() async{

    try {
      isLoading(true);
      var testReocrd = await ParentHistoryRemoteService.fetchChildrenTestRecord();
      if (testReocrd != null) {
        testRecordList.assignAll(testReocrd);

      } else {
        statusMsj("No any class".tr);
      }
    } finally {
      isLoading(false);
    }
    
  }

}