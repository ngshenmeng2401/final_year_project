import 'dart:io';

import 'package:final_year_project/pages/profile/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatelessWidget {

  final editProfileController = Get.put(EditProfileController());
  final String? name;
  final String? phoneNo;
  final String? imgStatus;
  EditProfileView({ Key? key, this.name, this.phoneNo, this.imgStatus }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Profile'.tr,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Container(
                height: screenHeight / 4,
                child: Obx(() => editProfileController.compressImagePath.value == ''
                    ? Center(
                      child: Text("Please select a picture",
                        style: TextStyle(fontSize: 22),))
                    : Image.file(
                        File(editProfileController.cropImagePath.value),
                          width: double.infinity,
                          height: 300,
                      ),
                  ),
              ),
              const SizedBox(height: 10),
              Obx(() => editProfileController.compressImageSize.value == ''
                ? const Text("")
                : Text(editProfileController.compressImageSize.value,
                    style: const TextStyle(fontSize:20),
                  ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: screenWidth/4,
                    height: screenHeight/18,
                    color: Colors.blue,
                    onPressed: () {
                      editProfileController.getImage(ImageSource.camera, phoneNo!);
                    },
                    child: const Text("Camera",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  MaterialButton(
                    minWidth: screenWidth/4,
                    height: screenHeight/18,
                    color: Colors.blue,
                    onPressed: () {
                      editProfileController.getImage(ImageSource.gallery, phoneNo!);
                    },
                    child: const Text("Gallery",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),),
                  ),
                ],
              ),
              Divider(height: screenHeight/20),
              Container(
                width: screenWidth/1.5,
                child: Column(
                  children: [
                    Text("Profile Details",
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    TextField(
                      keyboardType: TextInputType.name,
                      controller: editProfileController.userNameController,
                      decoration: InputDecoration(
                        hintText: 
                        "Username".tr,
                        icon: Icon(Icons.person,)
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      minWidth: screenWidth/4,
                      height: screenHeight/24,
                      color: Colors.blue,
                      onPressed: () {
                        editProfileController.editUserName("0");
                      },
                      child: const Text("Edit",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: editProfileController.phoneNoController,
                      decoration: InputDecoration(
                        labelText: 
                        "Phone No".tr,
                        icon: Icon(Icons.phone,)
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                      minWidth: screenWidth/4,
                      height: screenHeight/24,
                      color: Colors.blue,
                      onPressed: () {
                        editProfileController.editPhoneNo(phoneNo!);
                      },
                      child: const Text("Edit",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),),
                    ),
                  ],
                ),
              ),
              Divider(height: screenHeight/20),
            ],
          ),
        )
      )  
    );
  }
}