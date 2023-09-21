import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../master_url/master_url.dart';
import '../../view/stylish_tab_bar_view.dart';
import 'card_list_controller.dart';

class RemoveCardController extends GetxController{
  CardListController cardListController = Get.put(CardListController());
  RxBool loading = false.obs;

  Future removeCardApi(String cardId) async {
    loading.value = true;
    final sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('token');

    try {
      var response = await http.post(
          Uri.parse("${MasterUrl.apiLink}remove_card"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: {
            "card_id": cardId.toString(),
          }
      );

      var data = json.decode(response.body);

      if (data['message'].toString() == 'Card Deleted') {

        loading.value = false;
        Get.back();
        Get.snackbar(data['message'].toString(), '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
        // cardListController.cardListApi();
        Get.to( const StylishTabBarView1(1));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const NotificationScreen()));

      } else {
        loading.value = false;
        Get.back();
        Get.snackbar(data['message'].toString(), '',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
      }
    }
    catch (e) {
      loading.value = false;
      Get.back();
      if (kDebugMode) {
        print(e);
      }
    }
  }
}