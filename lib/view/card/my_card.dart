import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../master_url/master_url.dart';
import '../../res/colour.dart';
import '../../view_model/card_controller/card_list_controller.dart';
import '../../view_model/card_controller/search_card_controller.dart';
import '../notification/notification_screen.dart';
import 'add_new_card.dart';
import 'manage_card-red.dart';
import 'manage_card_blue.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  CardListController cardListController = Get.put(CardListController());
  SearchCardController searchCardController = Get.put(SearchCardController());

  List image = [
    Image.asset(
      'assets/images/Group 2384.png',
      // height: 100,
      // scale: 0.1,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Group 2385.png',
      // height: 100,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Group 2474.png',
      // height: 100,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Group 2474.png',
      // height: 100,
      fit: BoxFit.cover,
    ),
  ];

  @override
  void initState() {
    cardListController.cardListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightGray,
      body: SingleChildScrollView(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
              child: AppBar(
                iconTheme: IconThemeData(
                  color: lightGray, // Set the desired color here
                ),
                automaticallyImplyLeading: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(
                  "All My Card",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                      fontSize: 16),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationScreen()));
                    },
                    child: Image.asset(
                      'assets/images/Notification1.png',
                      // height: 25,
                      scale: 0.89,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 3, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // IconButton(
                  //     onPressed: (){},
                  //     icon: Image.asset('assets/images/Group 2473.png',
                  //       height: 50,)
                  // ),
                  // SizedBox(
                  //   height: 50,
                  //   width: size.width/1.3,
                  //   child: TextField(
                  //     controller: searchCardController.cardSearchController.value,
                  //     readOnly: false,
                  //     maxLength: 30,
                  //     cursorColor: Colors.grey,
                  //     decoration: InputDecoration(
                  //       counter: const Offstage(),
                  //       contentPadding: const EdgeInsets.symmetric(
                  //           horizontal: 20, vertical: 10),
                  //
                  //       suffixIcon:  IconButton(onPressed: (){
                  //         searchCardController.cardSearchApi();
                  //       },
                  //           icon: const Icon(Icons.search, color: Colors.black))
                  //       ,
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(25),
                  //           borderSide: BorderSide(color: Colors.grey)),
                  //       hintText: "Search",
                  //       hintStyle:
                  //       const TextStyle(fontSize: 14, color: Colors.black),
                  //     ),
                  //   ),
                  // ),
                  IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const AddNewCard()));
                        Get.to(const AddNewCard());
                      },
                      icon: const Icon(Icons.add_circle)),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: size.height / 1.3,
                child: FutureBuilder<dynamic>(
                  future: cardListController.cardListApi(), // async work
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                            heightFactor: 10,
                            child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return const Center(child: Text('No card found'));
                        } else {
                          return GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: cardListController.cardListData.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.91),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  if (index.isEven) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ManageCardRed(
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_number']
                                                          ['card']['party']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_number']
                                                          ['card']
                                                          ['description']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_number']
                                                          ['card']
                                                          ['front_image']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_number']
                                                          ['card']['back_image']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_id']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['status']
                                                      .toString(),
                                                )));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManageCardBlue(
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_number']
                                                          ['card']['party']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_number']
                                                          ['card']
                                                          ['description']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_number']
                                                          ['card']
                                                          ['front_image']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_number']
                                                          ['card']['back_image']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['card_id']
                                                      .toString(),
                                                  cardListController
                                                      .cardListData[index]
                                                          ['status']
                                                      .toString(),
                                                )));
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Image.network(
                                      '${MasterUrl.ipAddress}/${cardListController.cardListData[index]['card_number']['card']['front_image'].toString()}',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                    }
                  },
                ),
                //           cardListController.cardListData.isNotEmpty?Obx(()=>
                //              GridView.builder(
                //               scrollDirection: Axis.vertical,
                //               itemCount: cardListController.cardListData.length,
                //               gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //                   crossAxisCount: 2,
                //                   childAspectRatio: 0.91
                //               ),
                //               itemBuilder: (BuildContext context, int index) {
                //                 String cardNumber = cardListController.cardListData[index]['card_number']['card_number'].toString();
                //                 if (searchCardController.cardSearchController.value.text.isEmpty) {
                //                   return GestureDetector(
                //   onTap: () {
                //     if (index.isEven) {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   ManageCardRed(
                //                       cardListController
                //                           .cardListData[index]['card_number']['card']['party']
                //                           .toString(),
                //                       cardListController
                //                           .cardListData[index]['card_number']['card']['description']
                //                           .toString(),
                //                       cardListController
                //                           .cardListData[index]['card_number']['card']['front_image']
                //                           .toString(),
                //                       cardListController
                //                           .cardListData[index]['card_number']['card']['back_image']
                //                           .toString()
                //                   )));
                //     } else {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   ManageCardBlue(
                //                       cardListController
                //                           .cardListData[index]['card_number']['card']['party']
                //                           .toString(),
                //                       cardListController
                //                           .cardListData[index]['card_number']['card']['description']
                //                           .toString(),
                //                       cardListController
                //                           .cardListData[index]['card_number']['card']['front_image']
                //                           .toString(),
                //                       cardListController
                //                           .cardListData[index]['card_number']['card']['back_image']
                //                           .toString()
                //                   )));
                //     }
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                //     child: Image.network('${MasterUrl.ipAddress}/${cardListController
                //         .cardListData[index]['card_number']['card']['front_image']
                //         .toString()}'),
                //   ),
                // );
                //                 }else if(cardNumber.toLowerCase().toString().contains(searchCardController.cardSearchController.value.text.toLowerCase())){
                //                   return GestureDetector(
                //                     onTap: () {
                //                       if (index.isEven) {
                //                         Navigator.push(
                //                             context,
                //                             MaterialPageRoute(
                //                                 builder: (context) =>
                //                                     ManageCardRed(
                //                                         cardListController
                //                                             .cardListData[index]['card_number']['card']['party']
                //                                             .toString(),
                //                                         cardListController
                //                                             .cardListData[index]['card_number']['card']['description']
                //                                             .toString(),
                //                                         cardListController
                //                                             .cardListData[index]['card_number']['card']['front_image']
                //                                             .toString(),
                //                                         cardListController
                //                                             .cardListData[index]['card_number']['card']['back_image']
                //                                             .toString()
                //                                     )));
                //                       } else {
                //                         Navigator.push(
                //                             context,
                //                             MaterialPageRoute(
                //                                 builder: (context) =>
                //                                     ManageCardBlue(
                //                                         cardListController
                //                                             .cardListData[index]['card_number']['card']['party']
                //                                             .toString(),
                //                                         cardListController
                //                                             .cardListData[index]['card_number']['card']['description']
                //                                             .toString(),
                //                                         cardListController
                //                                             .cardListData[index]['card_number']['card']['front_image']
                //                                             .toString(),
                //                                         cardListController
                //                                             .cardListData[index]['card_number']['card']['back_image']
                //                                             .toString()
                //                                     )));
                //                       }
                //                     },
                //                     child: Padding(
                //                       padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                //                       child: Image.network('${MasterUrl.ipAddress}/${cardListController
                //                           .cardListData[index]['card_number']['card']['front_image']
                //                           .toString()}'),
                //                     ),
                //                   );
                //                 }else{
                //                   return Container();
                //                 }
                //               },
                //             ),
                //           ):Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
