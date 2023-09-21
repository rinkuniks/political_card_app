import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_page/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../master_url/master_url.dart';
import '../res/colour.dart';
import '../view_model/card_controller/card_list_controller.dart';
import '../view_model/card_controller/search_card_controller.dart';
import '../view_model/my_account_controller/my_profile_controller.dart';
import 'card/manage_card-red.dart';
import 'card/manage_card_blue.dart';
import 'notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchCardController searchCardController = Get.put(SearchCardController());
  CardListController cardListController = Get.put(CardListController());
  MyProfileController myProfileController = Get.put(MyProfileController());

  // List<ItemDetaill12> _employees = [];
  // Future<dynamic> generateEmployeeList() async {
  //   final response = await http
  //       .get(Uri.parse(''));
  //
  //   var list = json.decode(response.body);
  //   _employees = await list
  //       .map<ItemDetaill12>((json) => ItemDetaill12.fromJson(json))
  //       .toList();
  //   setState(() {});
  // }
  Duration defaultDuration = const Duration(days: 2, hours: 2, minutes: 30);
  EdgeInsets defaultPadding =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 5);

  @override
  void initState() {
    super.initState();
    print("========Coming");
      // cardListController.cardListApi();
      myProfileController.profileDetailsApi();
      sharedPrefData();
  }

  void sharedPrefData() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedName = sharedPref.getString('name');
    setState(() {});
  }

  dynamic sharedName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: primaryGray,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: "Hello, ",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                      fontSize: 20),
                  children: [
                    TextSpan(
                        // text: 'Suraj!',
                        text: sharedName != null ? sharedName.toString() : '',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis),
                          fontSize: 20,
                        )),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text(' What will you do today?',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/cart.png',
            scale: 2.3,
            color: Colors.black45,
          ),
          // const SizedBox(width: 0,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
            },
            child: Image.asset(
              'assets/images/Notification1.png',
              // height: 25,
              scale: 0.89,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 400,
              decoration: BoxDecoration(
                color: primaryGray,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(color: darkBlue),
                  const BoxShadow(
                    color: Color(0xFFb1b1b1),
                    spreadRadius: 6.0,
                    blurRadius: 16.0,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // const SizedBox(height: 25,),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       RichText(
                  //         // textAlign: TextAlign.right,
                  //         text:    TextSpan(
                  //           text: "Hello,",
                  //           style: GoogleFonts.poppins(
                  //               textStyle: const TextStyle(
                  //                   color: Colors.black,
                  //                 fontWeight: FontWeight.w400
                  //                   ),
                  //               fontSize: 20),
                  //           children: [
                  //             TextSpan(
                  //               // text: 'Suraj!',
                  //               text: sharedName!=null?sharedName.toString():'',
                  //                 style: GoogleFonts.poppins(
                  //                     textStyle: const TextStyle(
                  //                         fontWeight: FontWeight.w600,
                  //                         color: Colors.black, ),
                  //                     fontSize: 20)
                  //             ),
                  //
                  //           ],
                  //         ),
                  //       ),
                  //       Row(
                  //         children: [
                  //           Image.asset('assets/images/cart.png',
                  //           height: 25,
                  //           color: Colors.black45,),
                  //           const SizedBox(width: 8,),
                  //           GestureDetector(
                  //             onTap: (){
                  //               Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                       builder: (context) => const NotificationScreen()));
                  //             },
                  //             child: Image.asset('assets/images/Notification1.png',
                  //             // height: 25,
                  //               scale: 0.89,
                  //               ),
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  //  Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  //     child: Text('What will you do today?',
                  //         style: GoogleFonts.poppins(
                  //             textStyle: const TextStyle(
                  //                 fontWeight: FontWeight.w300,
                  //                 color: Colors.black,),
                  //             fontSize: 12)),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            // color: Colors.black12,
                            color: primaryGray,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            spreadRadius: -3.0,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller:
                            searchCardController.cardSearchController.value,
                        // onTap:(){
                        //   // Navigator.push(
                        //   //     context,
                        //   //     MaterialPageRoute(
                        //   //         builder: (context) => const MyCard()));
                        //   Get.to(const MyCard());
                        // },
                        onTap: () => showSearch(
                          context: context,
                          delegate: SearchPage(
                            barTheme: ThemeData(
                                appBarTheme: const AppBarTheme(
                                    backgroundColor: Colors.white,
                                    iconTheme: IconThemeData(
                                      color: Colors
                                          .black, // Set the desired color here
                                    ),
                                    elevation: 0)),
                            onQueryUpdate: print,
                            items: cardListController.cardListData,
                            searchLabel: 'Search',
                            suggestion: const Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image(
                                    //   image: AssetImage("assets/images/searchimage.png"),fit: BoxFit.cover,
                                    //   height: 350,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            failure: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image(
                                  //   width: size.width*1.5,
                                  //   image: const AssetImage("assets/images/nodatafound.jpg"),fit: BoxFit.cover,
                                  //   height: 350,
                                  // ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'No card Found ☹️☹️☹️',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            filter: (person) => [
                              person['card_number']['card_number'].toString(),
                              person['card_number']['card']['party'].toString(),
                              // person.Mrp.toString(),
                              // person.age.toString(),
                            ],
                            // sort: (a, b) => a.compareTo(b),
                            builder: (person) => Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ManageCardRed(
                                                person['card_number']['card']
                                                        ['party']
                                                    .toString(),
                                                person['card_number']['card']
                                                        ['description']
                                                    .toString(),
                                                person['card_number']['card']
                                                        ['front_image']
                                                    .toString(),
                                                person['card_number']['card']
                                                        ['back_image']
                                                    .toString(),
                                                person['card_number']['card_id']
                                                    .toString(),
                                                person['card_number']['status']
                                                    .toString(),
                                              )));
                                },
                                title: Text(
                                  "Card Number : ${person['card_number']['card_number'].toString()}",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 0.3),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                  "Party Name    : ${person['card_number']['card']['party'].toString()}",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 0.3),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: Image.network(
                                    '${MasterUrl.ipAddress}/${person['card_number']['card']['front_image'].toString()}'),
                              ),
                            ),
                          ),
                        ),
                        readOnly: true,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          suffixIcon:
                              const Icon(Icons.search, color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black,
                          child: Image.asset(
                            'assets/images/Group 2504.png',
                            scale: 2.7,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text('Your Dashboard',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    letterSpacing: 0.3),
                                fontSize: 20))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // height: 120,
                        width: size.width / 4.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/Group 2355.png',
                              height: 25,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Score'),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '00',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width / 4.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/Group 2354.png',
                              height: 25,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Rank'),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '00',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width / 4.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/Group 2356.png',
                              height: 25,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Level'),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '00',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(23, 20, 0, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Know more',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 9,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                // width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryGray,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 19,
                      backgroundColor: Colors.black,
                      child: Image.asset(
                        'assets/images/Group 2502.png',
                        scale: 2.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Next Quiz',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: 0.3),
                            fontSize: 20)),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SlideCountdownSeparated(
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          separator: '',
                          separatorType: SeparatorType.symbol,
                          duration: defaultDuration,
                          padding: defaultPadding,
                        ),
                        Text('DAYS    HRS     MIN     SEC  ',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    letterSpacing: 0.3),
                                fontSize: 9))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.black,
                    child: Image.asset(
                      'assets/images/Group 2503.png',
                      scale: 2.5,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text('Cards',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          fontSize: 20))
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            //   child: SizedBox(
            //     height: size.height / 1.7,
            //     // height: size.height/3.5,
            //     child: FutureBuilder<dynamic>(
            //       future: cardListController.cardListApi(), // async work
            //       builder:
            //           (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //         switch (snapshot.connectionState) {
            //           case ConnectionState.waiting:
            //             return const Center(
            //                 heightFactor: 10,
            //                 child: CircularProgressIndicator());
            //           default:
            //             if (snapshot.hasError) {
            //               return const Center(child: Text('No card found'));
            //             } else{
            //               return GridView.builder(
            //                 scrollDirection: Axis.vertical,
            //                 physics: const NeverScrollableScrollPhysics(),
            //                 itemCount: cardListController.cardListData.length,
            //                 gridDelegate:
            //                     const SliverGridDelegateWithFixedCrossAxisCount(
            //                         crossAxisCount: 2, childAspectRatio: 0.91),
            //                 itemBuilder: (BuildContext context, int index) {
            //                   return GestureDetector(
            //                     onTap: () {
            //                       if (index.isEven) {
            //                         Navigator.push(
            //                             context,
            //                             MaterialPageRoute(
            //                                 builder: (context) => ManageCardRed(
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_number']
            //                                               ['card']['party']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_number']
            //                                               ['card']
            //                                               ['description']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_number']
            //                                               ['card']
            //                                               ['front_image']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_number']
            //                                               ['card']['back_image']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_id']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['status']
            //                                           .toString(),
            //                                     )));
            //                       }else if(cardListController.cardListData.isEmpty){
            //                          const Center(child: Text('No card found'));
            //                       } else {
            //                         Navigator.push(
            //                             context,
            //                             MaterialPageRoute(
            //                                 builder: (context) =>
            //                                     ManageCardBlue(
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_number']
            //                                               ['card']['party']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_number']
            //                                               ['card']
            //                                               ['description']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_number']
            //                                               ['card']
            //                                               ['front_image']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_number']
            //                                               ['card']['back_image']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['card_id']
            //                                           .toString(),
            //                                       cardListController
            //                                           .cardListData[index]
            //                                               ['status']
            //                                           .toString(),
            //                                     )));
            //                       }
            //                     },
            //                     child: Padding(
            //                       padding:
            //                           const EdgeInsets.fromLTRB(8, 4, 8, 4),
            //                       child: Card(
            //                         shape: RoundedRectangleBorder(
            //                             borderRadius:
            //                                 BorderRadius.circular(15)),
            //                         child: Image.network(
            //                           '${MasterUrl.ipAddress}/${cardListController.cardListData[index]['card_number']['card']['front_image'].toString()}',
            //                           fit: BoxFit.contain,
            //                         ),
            //                       ),
            //                     ),
            //                   );
            //                 },
            //               );
            //             }
            //         }
            //       },
            //     ),
            //     // GridView.builder(
            //     //   scrollDirection: Axis.vertical,
            //     //   itemCount: 1,
            //     //   physics: const NeverScrollableScrollPhysics(),
            //     //   gridDelegate:
            //     //   const SliverGridDelegateWithFixedCrossAxisCount(
            //     //       crossAxisCount: 1,
            //     //       childAspectRatio: 0.91
            //     //   ),
            //     //   itemBuilder: (BuildContext context, int index) {
            //     //    return Padding(
            //     //       padding: const EdgeInsets.all(3.0),
            //     //       child: Container(
            //     //         // height: 100,
            //     //         width: 80,
            //     //         padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            //     //           // child: image[index]
            //     //           child: Align(alignment:Alignment.topCenter,child: Text('No card available'))
            //     //         // child: Column(
            //     //         //     crossAxisAlignment: CrossAxisAlignment.start,
            //     //         //     children: [
            //     //         //       Container(
            //     //         //         height: 100,
            //     //         //         // height: MediaQuery.of(context).size.height/3.5,
            //     //         //         decoration: BoxDecoration(
            //     //         //             borderRadius: BorderRadius.circular(10),
            //     //         //             image:  DecorationImage(
            //     //         //               image: NetworkImage(MasterUrl.imageLink+_employees[index]['productImage'].toString()),
            //     //         //             )
            //     //         //         ),
            //     //         //
            //     //         //       ),
            //     //         //       Text(
            //     //         //         _employees[index]['ProductName'].toString(),
            //     //         //         style: const TextStyle(
            //     //         //             fontWeight:
            //     //         //             FontWeight.bold,
            //     //         //             fontSize: 14,
            //     //         //             color: Colors.black),
            //     //         //         softWrap: true,
            //     //         //         maxLines: 2,
            //     //         //         overflow: TextOverflow.fade,textAlign: TextAlign.left,
            //     //         //       ),
            //     //         //       Row(
            //     //         //         mainAxisAlignment: MainAxisAlignment.start,
            //     //         //         children: [
            //     //         //           Text(
            //     //         //             "Brand : ${_employees[index]['Brands'].toString()}",
            //     //         //             style: const TextStyle(
            //     //         //
            //     //         //                 fontSize: 14,
            //     //         //                 color: Colors.black38),
            //     //         //             softWrap: true,
            //     //         //             overflow: TextOverflow.fade,textAlign: TextAlign.left,
            //     //         //           ),
            //     //         //         ],
            //     //         //       ),
            //     //         //
            //     //         //       Row(
            //     //         //         mainAxisAlignment: MainAxisAlignment.start,
            //     //         //         children: [
            //     //         //           rateType.toString()=='WSP'?Text(
            //     //         //             "WSP : ₹${double.parse(_employees[index]['WSP'].toString()).toStringAsFixed(2)}",
            //     //         //             style: const TextStyle(
            //     //         //                 fontWeight:
            //     //         //                 FontWeight.bold,
            //     //         //                 fontSize: 17,
            //     //         //                 color: Colors.green),
            //     //         //             softWrap: true,
            //     //         //             overflow: TextOverflow.fade,textAlign: TextAlign.left,
            //     //         //           ):
            //     //         //           Text(
            //     //         //             "MRP ₹${double.parse(_employees[index]['Mrp'].toString()).toStringAsFixed(2)}",
            //     //         //             style: const TextStyle(
            //     //         //                 fontWeight: FontWeight.w300,
            //     //         //                 decorationColor: Colors.redAccent, // Optionally set the color of the line
            //     //         //                 decorationThickness: 2.0,
            //     //         //                 decoration: TextDecoration.lineThrough,
            //     //         //
            //     //         //                 fontSize: 16,
            //     //         //                 color: Colors.black),
            //     //         //             softWrap: true,
            //     //         //             overflow: TextOverflow.fade,textAlign: TextAlign.left,
            //     //         //           )
            //     //         //         ],
            //     //         //       ),
            //     //         //       if(rateType.toString()=='Mrp') Row(
            //     //         //         mainAxisAlignment: MainAxisAlignment.start,
            //     //         //         children: [
            //     //         //           Text(
            //     //         //             "₹${double.parse(_employees[index]['SaleRate'].toString()).toStringAsFixed(2)}",
            //     //         //             style: const TextStyle(
            //     //         //                 fontWeight:
            //     //         //                 FontWeight.bold,
            //     //         //                 fontSize: 17,
            //     //         //                 color: Colors.green),
            //     //         //             softWrap: true,
            //     //         //             overflow: TextOverflow.fade,textAlign: TextAlign.left,
            //     //         //           ),
            //     //         //         ],
            //     //         //       ),
            //     //         //     ]),
            //     //       ),
            //     //     );
            //     //   },
            //     // ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  List image = [
    Image.asset(
      'assets/images/Group 2399.png',
      // height: 100,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Group 2399.png',
      // height: 100,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Group 2399.png',
      // height: 100,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Group 2399.png',
      // height: 100,
      fit: BoxFit.cover,
    ),
  ];

  @override
  void dispose() {
    print("=========dispose");
    super.dispose();
  }
}
