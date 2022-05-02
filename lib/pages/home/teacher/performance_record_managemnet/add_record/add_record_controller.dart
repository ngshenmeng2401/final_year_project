import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/service/teacher_remote_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddRecordController extends GetxController{

  final List<String> levelLQ = ["1","1","1","1"];
  final List<String> levelRQ = ["1","1","1","1"];
  final List<String> levelSQ = ["1","1","1","1","1"];
  final List<String> levelWQ = ["1","1"];

  final List<String> level = [
    "1",
    "2",
    "3",
  ];

  final appData = GetStorage(); 
  var studentList = <Student>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {

    super.onInit();
    loadStudentList();
  }

  void loadStudentList() async{

    String className = appData.read("className")??'';

    // try {
    //   isLoading(true);
    //   var student = await TeacherRemoteServices.fetchStudent(className);
    //   if (student != null) {
    //     studentList.assignAll(student);
    //   } else {
    //     statusMsj("No any post".tr);
    //   }
    // } finally {
    //   isLoading(false);
    // }
    
  }

  void chooseLQLevel(value, int index){
    levelLQ[index] = value;
    print(levelLQ);
    update();
  }

  void chooseRQLevel(value, int index){
     levelRQ[index] = value;
     print(levelRQ);
     update();
  }

  void chooseSQLevel(value, int index){
     levelSQ[index] = value;
     print(levelSQ);
     update();
  }

  void chooseWQLevel(value, int index){
     levelWQ[index] = value;
     print(levelWQ);
     update();
  }
}