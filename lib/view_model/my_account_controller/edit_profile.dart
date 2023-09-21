import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../master_url/master_url.dart';
import 'package:http/http.dart';
import 'my_profile_controller.dart';

class EditProfileController extends GetxController{
  MyProfileController myProfileController = Get.put(MyProfileController());
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  // final genderController = SingleValueDropDownController().obs;
  final dobController = TextEditingController().obs;
  final locationController = TextEditingController().obs;
  final mobileController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  RxBool loading = false.obs;

  void editProfileApi() async {
    loading.value = true;
    final sharedPref = await SharedPreferences.getInstance();
    final String token = sharedPref.getString('token')!;

    try{
      var responce = await post(Uri.parse("${MasterUrl.apiLink}update_profile"),
          body: {
            "first_name"   :firstNameController.value.text.isNotEmpty?firstNameController.value.text:myProfileController.profileFirstName.value,
            "last_name"   :lastNameController.value.text.isNotEmpty?lastNameController.value.text:myProfileController.profileLastName.value,
            // "gender"   :genderController.value.dropDownValue!.name.isNotEmpty?genderController.value.dropDownValue!.name.toString():myProfileController.profileGender.value.toString(),
            "gender"   :myProfileController.profileGender.value,
            "dob":dobController.value.text.isNotEmpty?dobController.value.text:myProfileController.profileDob.value,
            "location":locationController.value.text.isNotEmpty?locationController.value.text:myProfileController.profileLocation.value,
            "mobile":mobileController.value.text.isNotEmpty?mobileController.value.text:myProfileController.profileMobile.value,
            "email":myProfileController.profileEmail.value,
          },
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
      var data = json.decode(responce.body);
      if (data['message'].toString() == 'Your profile successfully updated') {
        loading.value = false;
        Get.snackbar('Updated Successfully', '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
        // Get.to( const StylishTabBarView1(0));
      } else {
        loading.value = false;
        Get.snackbar('Something went wrong', '',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
      }

    }catch(e){
      print('hellogfdg63456===$e');
      loading.value = false;
      // Get.snackbar('Exception', e.toString(),
      //     backgroundColor: Colors.red[300],
      //     colorText: Colors.black,
      //duration: Duration(seconds: 1),
      //     snackPosition: SnackPosition.TOP);
    }
  }
}