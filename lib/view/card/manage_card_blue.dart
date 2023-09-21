import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../master_url/master_url.dart';
import '../../res/colour.dart';
import '../../view_model/card_controller/card_list_controller.dart';
import '../home_screen.dart';
import '../notification/notification_screen.dart';
import 'manage_card-red.dart';
import 'my_card.dart';

class ManageCardBlue extends StatefulWidget {
  final String party;
  final String description;
  final String frontImage;
  final String backImage;
  final String cardId;
  final String cardStatus;
  const ManageCardBlue(this.party,this.description,this.frontImage,this.backImage,this.cardId,this.cardStatus,{super.key});

  @override
  State<ManageCardBlue> createState() => _ManageCardBlueState();
}

class _ManageCardBlueState extends State<ManageCardBlue> {
  CardListController cardListController = Get.put(CardListController());
  final con = FlipCardController();
  final con1 = FlipCardController();
  final cong = GestureFlipCardController();
  final cong1 = GestureFlipCardController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            AppBar(
              iconTheme: const IconThemeData(
                color: Colors.black, // Set the desired color here
              ),
              automaticallyImplyLeading: true,
              elevation: 0,
              backgroundColor:  primaryGray,
              title:  Text(
                "Manage My Card",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400
                    ),
                    fontSize: 16),
              ),
              actions: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()));
                  },
                  child: Image.asset('assets/images/Notification1.png',
                    // height: 25,
                    scale: 0.89,
                  ),
                ),
              ],
            ),

            Container(
              color: Colors.white,
              child: Container(
                height: 390,
                decoration:  BoxDecoration(
                  color: primaryGray,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10,top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        color: Colors.transparent,
                        height: 340,
                        width: size.width,
                        child: Stack(
                          children: [
                            //   CarouselSlider(
                            //   items: imageSliders.map(
                            //         (image) {
                            //       return Container(
                            //         margin: EdgeInsets.all(5),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.all(
                            //             Radius.circular(10),
                            //           ),
                            //           image:
                            //           DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                            //         ),
                            //       );
                            //     },
                            //   ).toList(),
                            //     options: CarouselOptions(
                            //         viewportFraction: 0.7,
                            //         aspectRatio: 1,
                            //         autoPlay: true,
                            //         enlargeCenterPage: true,
                            //       pageSnapping: false
                            //   ),
                            // ),
                            ///
                            GestureFlipCard(
                              axis: FlipAxis.vertical,
                              enableController: true,
                              animationDuration: const Duration(milliseconds: 1000),
                              // axis: FlipAxis.vertical,
                              controller: cong1,
                              frontWidget: Center(
                                child: Container(
                                  width: size.width,
                                  height: 300,
                                  // child: Image.asset(
                                  //   'assets/images/flipback.png',
                                  //   fit: BoxFit.contain,
                                  // ),
                                  child: Image.network(
                                    '${MasterUrl.ipAddress}/${widget.backImage}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              backWidget: Container(
                                width: size.width,
                                height: 300,
                                child: Image.network(
                                  '${MasterUrl.ipAddress}/${widget.frontImage}',
                                  fit: BoxFit.contain,
                                ),
                                // child: Image.asset(
                                //   'assets/images/flipfront.png',
                                //   fit: BoxFit.contain,
                                // )
                              ),
                            ),
                            Positioned(
                              bottom: 50,
                              right: 30,
                              child: GestureDetector(
                                onTap: (){
                                  cong.flipcard();
                                  cong1.flipcard();
                                },
                                child: GestureFlipCard(
                                  // rotateSide: RotateSide.left,
                                  // onTapFlipping: true,
                                  axis: FlipAxis.vertical,
                                  enableController: true,
                                  animationDuration: const Duration(milliseconds: 1000),
                                  // axis: FlipAxis.vertical,
                                  controller: cong,
                                  frontWidget: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          width: size.width,
                                          height: 300,
                                          child: Image.network(
                                            '${MasterUrl.ipAddress}/${widget.frontImage}',
                                            fit: BoxFit.contain,
                                          ),
                                          // child: Image.asset(
                                          //   'assets/images/flipfront.png',
                                          //   fit: BoxFit.contain,
                                          // ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 250,
                                        child: IconButton(
                                          onPressed: (){
                                            starController.setStar(starController.starBool.value);
                                          },
                                          icon: Obx(()=>
                                              Image.asset(
                                                'assets/images/Star 2.png',
                                                // fit: BoxFit.contain,
                                                height: 20,
                                                color: starController.starBool.value?Colors.amber:Colors.white,
                                              ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  backWidget: Stack(
                                    children: [
                                      Container(
                                        width: size.width,
                                        height: 300,
                                        child: Image.network(
                                          '${MasterUrl.ipAddress}/${widget.backImage}',
                                          fit: BoxFit.contain,
                                        ),
                                        // child: Image.asset(
                                        //   'assets/images/flipback.png',
                                        //   fit: BoxFit.contain,
                                        // )
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 250,
                                        child: IconButton(
                                          onPressed: (){
                                            starController.setStar(starController.starBool.value);
                                          },
                                          icon: Obx(()=>
                                              Image.asset(
                                                'assets/images/Star 2.png',
                                                // fit: BoxFit.contain,
                                                height: 20,
                                                color: starController.starBool.value?Colors.amber:Colors.white,
                                              ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   top: 10,
                            //   left: 160,
                            //   child: IconButton(
                            //     onPressed: (){},
                            //     icon: Image.asset(
                            //       'assets/images/Star 2.png',
                            //       // fit: BoxFit.contain,
                            //       height: 20,
                            //       color: Colors.amber,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      // Image.asset(
                      //   'assets/images/Group 2497.png',
                      //   // height: 300,
                      //   fit: BoxFit.cover,
                      // ),

                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: primaryGray,
              child: Container(
                // height: 400,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                          widget.party,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, letterSpacing: 0.5),
                              fontSize: 16)
                      ),
                      SizedBox(height: 10,),
                      Text(
                          widget.description,
                          // 'Daniel S. Sullivan, born Nov 13, 1964, is an Alaska Senator. Graduating from Culver Military Academy, Harvard, and Georgetown...',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                // fontWeight: FontWeight.bold,
                                  color: Colors.black, letterSpacing: 0.5),
                              fontSize: 12)
                      ),
                      SizedBox(height: 10,),
                      // Row(
                      //   children:  [
                      //     Text('Next ',
                      //         style: GoogleFonts.poppins(
                      //             textStyle: const TextStyle(
                      //               // fontWeight: FontWeight.bold,
                      //                 color: Colors.black, letterSpacing: 0.1),
                      //             fontSize: 10)),
                      //     CircleAvatar(
                      //       radius: 5,
                      //       backgroundColor: Colors.black,
                      //       child: Icon(Icons.arrow_forward_ios_outlined,
                      //         color:Colors.white,
                      //         size: 5,),
                      //     )
                      //     // Image.asset('assets/images/skip.png',
                      //     //   color: Colors.black.withOpacity(1.0),
                      //     //   colorBlendMode: BlendMode.color,
                      //     //   height: 50,)
                      //   ],
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                boxShadow:  [
                                  BoxShadow(
                                    color: primaryGray,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: -3.0,
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: OutlinedButton(

                                  style: OutlinedButton.styleFrom(
                                      shadowColor:Colors.transparent,
                                      //               backgroundColor: Color(0xFF0d1e2a),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                                      side: const BorderSide(
                                        color: Colors.transparent,
                                      )
                                  ),
                                  onPressed: removeDialog, child:  Text('Remove',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(color: Colors.black,),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),))
                          ),
                          Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  gradient:  LinearGradient(
                                      colors: [Colors.blue.shade300, Colors.blue],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter
                                  ),
                                  borderRadius: BorderRadius.circular(35)
                              ),
                              child: ElevatedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:  Colors.transparent,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),

                                  ),onPressed: (){
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) =>    const SignUpScreen()),
                                // );
                              }, child:  Text('Hide',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(color: Colors.white,),
                                    fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ),))),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void removeDialog() {
    Get.defaultDialog(
        title: 'Do you want to Remove?',
        titleStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
            fontSize: 18,
            fontWeight: FontWeight.w400),
        titlePadding: EdgeInsets.only(top: 20),
        content: Padding(
          padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
          child: Text(
            'Are you sure you want to delete your account?',
            style: GoogleFonts.poppins(
                textStyle:
                const TextStyle(color: Colors.white, letterSpacing: 0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 25),
        cancel: Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: primaryGray,
                ),
                const BoxShadow(
                  color: Colors.white,
                  spreadRadius: -3.0,
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shadowColor: primaryGray,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0)),
                    side: const BorderSide(
                      color: Colors.transparent,
                    )),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'No',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: 0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ))),
        confirm: Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.black, Colors.black38],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                borderRadius: BorderRadius.circular(35)),
            child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0)),
                ),
                onPressed: () {
                  removeCardApi(widget.cardId);
                },
                child: loading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : Text(
                  'Yes',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.white, letterSpacing: 0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ))),
        radius: 10.0);
  }
  bool loading = false;
  Future removeCardApi(String cardId) async {
    loading = true;
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

        loading = false;
        Get.back();
        Get.snackbar(data['message'].toString(), '',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
        cardListController.cardListApi();
        // Get.to( const StylishTabBarView1(1));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomeScreen()));

      } else {
        loading = false;
        Get.back();
        Get.snackbar(data['message'].toString(), '',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP);
      }
    }
    catch (e) {
      loading = false;
      Get.back();
      if (kDebugMode) {
        print(e);
      }
    }
  }
  final StarController starController = Get.put(StarController());
}
