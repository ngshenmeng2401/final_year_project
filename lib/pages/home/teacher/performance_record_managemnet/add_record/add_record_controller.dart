import 'package:get/get.dart';

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