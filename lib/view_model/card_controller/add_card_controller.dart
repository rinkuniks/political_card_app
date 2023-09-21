import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:political_card_app/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../master_url/master_url.dart';
import '../../view/stylish_tab_bar_view.dart';

class AddCardController extends GetxController {
  final addCardController = TextEditingController().obs;
  RxBool loading = false.obs;

  Future addCardApi() async {
    loading.value = true;
    final sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('token');

    try {
      var response =
          await http.post(Uri.parse("${MasterUrl.apiLink}add_card"), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        "card_number": addCardController.value.text,
      });
      var data = json.decode(response.body);
      if (data['message'].toString() == 'Card Successfully Added') {
        loading.value = false;
        Get.back();
        Get.snackbar(data['message'].toString(), '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
        Get.to( const StylishTabBarView1(2));
        addCardController.value.clear();
      } else {
        loading.value = false;
        Get.back();
        addCardController.value.clear();
        Get.snackbar(data['message'].toString(), '',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      loading.value = false;
      addCardController.value.clear();
      Get.back();
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
