import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../master_url/master_url.dart';
import '../view/stylish_tab_bar_view.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;

    try {
      var responce = await post(Uri.parse("${MasterUrl.apiLink}login"), body: {
        "email": emailController.value.text,
        "password": passwordController.value.text,
      });
      var data = json.decode(responce.body);

      if (data['message'].toString() == 'Login successful') {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('token', data['data']['token'].toString());
        await sharedPref.setString('name', data['data']['name'].toString());
        loading.value = false;
        Get.back();
        Get.snackbar('Login Successfully', 'Welcome Back!!!',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
        Get.to(const StylishTabBarView1(0));
      } else {
        loading.value = false;
        Get.back();
        Get.snackbar('Login Failed', 'UserId or Password are Incorrect!',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      loading.value = false;
      Get.back();
      // Get.snackbar('Exception', e.toString(),
      //     backgroundColor: Colors.red[300],
      //     colorText: Colors.black,
      //duration: Duration(seconds: 1),
      //     snackPosition: SnackPosition.TOP);
    }
  }
}
