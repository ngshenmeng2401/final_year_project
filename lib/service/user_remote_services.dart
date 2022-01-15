import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserRemoteServices {

  static var client = http.Client();

  static Future<String?> signUpUser(String email, String username , String phoneNo, String password, String referralCode) async {

    print(email);
    print(username);
    print(phoneNo);
    print(password);
    print(referralCode);
    
    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/final_year_project/signup_user.php'), 
      body: {
      "email" : email,
      "username" : username,
      "phoneNo" : phoneNo,
      "password" : password,
      "referralCode" : referralCode,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;

      Get.snackbar("Register Successful !!!","Please check your email to activate your account.");
      return resp;
    } else {
      // show error message
      Get.snackbar("Register Failed !!!","Please check your input value.");
      return null;
      // throw Exception("Error");
    }
    
  }
}