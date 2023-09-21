import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../master_url/master_url.dart';
import '../view/stylish_tab_bar_view.dart';

class SignUpController  extends GetxController{
  final firstName = TextEditingController().obs;
  final lastName = TextEditingController().obs;
  final email = TextEditingController().obs;
  final mobile = TextEditingController().obs;
  final password = TextEditingController().obs;
  final confirmPassword = TextEditingController().obs;
  RxBool loading = false.obs;

  void signUpApi() async {
    loading.value = true;
    try{
      var responce = await post(Uri.parse("${MasterUrl.apiLink}register"),
          body: {
            "first_name":firstName.value.text,
            "last_name":lastName.value.text,
            "email":email.value.text,
            "mobile":mobile.value.text,
            "password":password.value.text,
            "c_password":confirmPassword.value.text,
            "gender":'other',
          }
      );
      var data = json.decode(responce.body);
      if (data['message'].toString() == 'You are successfully registered')
      {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('token',data['data']['token'].toString());
        await sharedPref.setString('name',data['data']['name'].toString());
        loading.value = false;
        Get.snackbar('SignUp Successfully','',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
        Get.to( const StylishTabBarView1(0));
      } else {
        loading.value = false;
        Get.snackbar('Registration Failed', 'something went wrong!',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
      }
    }catch(e){
      loading.value = false;
      // Get.snackbar('Exception', e.toString(),
      //     backgroundColor: Colors.red[300],
      //     colorText: Colors.black,
      //duration: Duration(seconds: 1),
      //     snackPosition: SnackPosition.TOP);
    }
  }
}