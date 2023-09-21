import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../master_url/master_url.dart';

class MyProfileController extends GetxController{
  RxString profileName= ''.obs;
  RxString profileFirstName= ''.obs;
  RxString profileLastName= ''.obs;
  RxString profileEmail= ''.obs;
  RxString profileMobile= ''.obs;
  RxString profileGender= ''.obs;
  RxString profileDob= ''.obs;
  RxString profileLocation= ''.obs;

  Future profileDetailsApi() async {
    final sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('token');

    var response = await http.get(
      Uri.parse("${MasterUrl.apiLink}profile"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    var data = json.decode(response.body);
    profileName.value = data['data']['name'].toString();
    profileEmail.value = data['data']['email'].toString();
    profileMobile.value = data['data']['mobile'].toString();
    profileFirstName.value = data['data']['user_detail']['first_name'].toString();
    profileLastName.value = data['data']['user_detail']['last_name'].toString();
    profileGender.value = data['data']['user_detail']['gender'].toString();
    profileDob.value = data['data']['user_detail']['dob'].toString();
    profileLocation.value = data['data']['user_detail']['location'].toString();
  }
}