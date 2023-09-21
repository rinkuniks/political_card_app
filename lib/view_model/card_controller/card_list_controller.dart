import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../master_url/master_url.dart';

class CardListController extends GetxController{

  RxList cardListData = [].obs;

  Future<dynamic> cardListApi() async {
    final sharedPref = await SharedPreferences.getInstance();
    final String? token = sharedPref.getString('token');

    var response = await http.get(
        Uri.parse("${MasterUrl.apiLink}card_list"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    var data = json.decode(response.body);
    cardListData.value = data['data'];
    print('card listcouvb====${cardListData.length}');
    print('card list====${data['data'].toString()}');
    print('card list====${data['data'][0]['card_number']['card']['front_image'].toString()}');
    print('card list====${data['data'][0]['card_number']['card_number'].toString()}');

  }
}