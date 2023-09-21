import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../master_url/master_url.dart';
import '../view/start_screen.dart';

class LogOutController extends GetxController{
  RxBool loading = false.obs;
  Future logOutApi() async {
    loading.value = true;
    final sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('token');

    var response = await http.get(
        Uri.parse("${MasterUrl.apiLink}logout"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    var data = json.decode(response.body);
    if (data['message'].toString() == 'logged out successfully'){
      loading.value = false;
      Get.snackbar(data['message'].toString(), '',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.TOP);
      sharedPref.clear();
      Get.to( const StartScreen());
    }else{
      loading.value = false;
      Get.snackbar(data['message'].toString(), '',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.TOP);
    }
  }

}