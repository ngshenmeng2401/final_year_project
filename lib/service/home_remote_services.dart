import 'package:final_year_project/model/classroom.dart';
import 'package:final_year_project/model/listening_record.dart';
import 'package:final_year_project/model/reading_record.dart';
import 'package:final_year_project/model/speaking_record.dart';
import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/model/writing_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeRemoteServices{

  static var client = http.Client();

  static Future<List<Student>?> fetchStudentWithClass(String className) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_student_with_class.php"),
          body: {
            "className":className,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return studentFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<List<Classroom>?> fetchClassroom(String name, String action, String sortValue) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_classroom.php"),
          body: {
            "name":name,
            "action" : action,
            "sortValue" : sortValue,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return classroomFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<String?> addListeningRecord(String studentId, String lq1, String lq2, String lq3, String lq4) async {
    
    print(studentId);
    print(lq1);
    print(lq2);
    print(lq3);
    print(lq4);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/add_listening_record.php'), 
      body: {
      "studentId" : studentId,
      "lq1" : lq1,
      "lq2" : lq2,
      "lq3" : lq3,
      "lq4" : lq4,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Add Successful", "");

      return resp;
    }else if (response.body == "Duplicate") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "The student id is already in the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Add Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> addReadingRecord(String studentId, String rq1, String rq2, String rq3, String rq4) async {
    
    print(studentId);
    print(rq1);
    print(rq2);
    print(rq3);
    print(rq4);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/add_reading_record.php'), 
      body: {
      "studentId" : studentId,
      "rq1" : rq1,
      "rq2" : rq2,
      "rq3" : rq3,
      "rq4" : rq4,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Add Successful", "");

      return resp;
    }else if (response.body == "Duplicate") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "The student id is already in the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Add Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> addSpeakingRecord(String studentId, String sq1, String sq2, String sq3, String sq4, String sq5) async {
    
    print(studentId);
    print(sq1);
    print(sq2);
    print(sq3);
    print(sq4);
    print(sq5);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/add_speaking_record.php'), 
      body: {
      "studentId" : studentId,
      "sq1" : sq1,
      "sq2" : sq2,
      "sq3" : sq3,
      "sq4" : sq4,
      "sq5" : sq5,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Add Successful", "");

      return resp;
    }else if (response.body == "Duplicate") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "The student id is already in the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Add Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> addWritingRecord(String studentId, String wq1, String wq2) async {
    
    print(studentId);
    print(wq1);
    print(wq2);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/add_writing_record.php'), 
      body: {
      "studentId" : studentId,
      "wq1" : wq1,
      "wq2" : wq2,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Add Successful", "");

      return resp;
    }else if (response.body == "Duplicate") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "The student id is already in the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Add Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> editListeningRecord(String studentId, String lq1, String lq2, String lq3, String lq4) async {
    
    print(studentId);
    print(lq1);
    print(lq2);
    print(lq3);
    print(lq4);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/edit_listening_record.php'), 
      body: {
      "studentId" : studentId,
      "lq1" : lq1,
      "lq2" : lq2,
      "lq3" : lq3,
      "lq4" : lq4,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Edit Successful", "");

      return resp;
    }else if (response.body == "NotFound") {
      var resp = response.body;
      
      getSnackBar("Edit Failed", "Can't found the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> editReadingRecord(String studentId, String rq1, String rq2, String rq3, String rq4) async {
    
    print(studentId);
    print(rq1);
    print(rq2);
    print(rq3);
    print(rq4);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/edit_reading_record.php'), 
      body: {
      "studentId" : studentId,
      "rq1" : rq1,
      "rq2" : rq2,
      "rq3" : rq3,
      "rq4" : rq4,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Edit Successful", "");

      return resp;
    }else if (response.body == "NotFound") {
      var resp = response.body;
      
      getSnackBar("Edit Failed", "Can't found the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> editSpeakingRecord(String studentId, String sq1, String sq2, String sq3, String sq4, String sq5) async {
    
    print(studentId);
    print(sq1);
    print(sq2);
    print(sq3);
    print(sq4);
    print(sq5);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/edit_speaking_record.php'), 
      body: {
      "studentId" : studentId,
      "sq1" : sq1,
      "sq2" : sq2,
      "sq3" : sq3,
      "sq4" : sq4,
      "sq5" : sq5,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Edit Successful", "");

      return resp;
    }else if (response.body == "NotFound") {
      var resp = response.body;
      
      getSnackBar("Edit Failed", "Can't found the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> editWritingRecord(String studentId, String wq1, String wq2) async {
    
    print(studentId);
    print(wq1);
    print(wq2);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/edit_writing_record.php'), 
      body: {
      "studentId" : studentId,
      "wq1" : wq1,
      "wq2" : wq2,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Edit Successful", "");

      return resp;
    }else if (response.body == "NotFound") {
      var resp = response.body;
      
      getSnackBar("Edit Failed", "Can't found the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> deleteRecord(String category, String studentId) async {
    
    print(studentId);
    print(category);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/delete_question_record.php'), 
      body: {
      "studentId" : studentId,
      "category" : category,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Delete Successful", "");

      return resp;
    }else if (response.body == "NotFound") {
      var resp = response.body;
      
      getSnackBar("Delete Failed", "Can't found the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Delete Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<List<ListeningRecord>?> fetchListeningRecord(String className, String action, String name, String sortValue) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_listening_record.php"),
          body: {
            "className":className,
            "action" : action,
            "name" : name,
            "sortValue" : sortValue,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return listeningRecordFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<List<ReadingRecord>?> fetchReadingRecord(String className, String action, String name, String sortValue) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_reading_record.php"),
          body: {
            "className":className,
            "action" : action,
            "name" : name,
            "sortValue" : sortValue,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return readingRecordFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<List<SpeakingRecord>?> fetchSpeakingRecord(String className, String action, String name, String sortValue) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_speaking_record.php"),
          body: {
            "className":className,
            "action" : action,
            "name" : name,
            "sortValue" : sortValue,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return speakingRecordFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<List<WritingRecord>?> fetchWritingRecord(String className, String action, String name, String sortValue) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_writing_record.php"),
          body: {
            "className":className,
            "action" : action,
            "name" : name,
            "sortValue" : sortValue,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return writingRecordFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static void getSnackBar(String title, String subtitle){

    Get.snackbar(
      title,subtitle,
      backgroundColor: Colors.white60,
      colorText: Colors.black,
      icon: const Icon(Icons.error, color: Colors.black),
      snackPosition: SnackPosition.TOP,  
    );
  }
}