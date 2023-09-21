import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../master_url/master_url.dart';

class SearchCardController extends GetxController{
  final cardSearchController = TextEditingController().obs;

  RxList searchData = [].obs;

  Future cardSearchApi() async {
    final sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('token');

    var response = await http.get(
        Uri.parse("${MasterUrl.apiLink}search_card?search=${cardSearchController.value.text}"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        // body: {
        //   // "search":cardSearchController.value.text,
        //   "search":'951572678334',
        // }
    );
    print('card lisxxfgcvt====${response.body.isNotEmpty}');
    var data = json.decode(response.body);
    // searchData.value= data;
    print('card list====${data['data'].toString()}');
    print('card lisxxcvt====${data['data']}');
  }
}