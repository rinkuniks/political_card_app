import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/res/colour.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGray,
      appBar: AppBar(
        iconTheme:  IconThemeData(
          color: Colors.black, // Set the desired color here
        ),
        elevation: 0,
        backgroundColor: primaryGray,
        title:  Text('Notification',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
              fontSize: 18,
            // fontWeight: FontWeight.bold
          ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,top: 10,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 0,bottom: 0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 70,
                      child: ElevatedButton(
                          onPressed: (){},
                          style: OutlinedButton.styleFrom(

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              side: const BorderSide(
                                color: Colors.transparent,
                              )
                          ),
                          child:  Text('All',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
                              fontSize: 14,
                              // fontWeight: FontWeight.bold
                            ),)
                      ),
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: TextButton(
                          onPressed: (){},
                          child:  Text('Read',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                              fontSize: 14,
                              // fontWeight: FontWeight.bold
                            ),)
                      ),
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: TextButton(
                          onPressed: (){},
                          child:  Text('Unread',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                              fontSize: 14,
                              // fontWeight: FontWeight.bold
                            ),)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
               Text('Today',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow:  [
                            BoxShadow(
                              color: primaryGray,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: -2.0,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/profile.png',
                            // height: 25,
                            scale: 3.5,
                            color: blue),
                      ),
                    ),
                    Text('  Lorem ipsum dolor sit amet, dolor sit\n  adipiscing elit',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                          fontSize: 12,
                          // fontWeight: FontWeight.bold
                      ),)
                  ],),
                  SizedBox(height: 10,),
                  Text('           1m ago',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                        fontSize: 12,
                        // fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow:  [
                            BoxShadow(
                              color: primaryGray,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: -2.0,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/profile.png',
                            // height: 25,
                            scale: 3.5,
                            color: blue),
                      ),
                    ),
                    Text('  Lorem ipsum dolor sit amet, dolor sit\n  adipiscing elit',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                        fontSize: 12,
                        // fontWeight: FontWeight.bold
                      ),)
                  ],),
                  SizedBox(height: 10,),
                  Text('           5hrs ago',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                      fontSize: 12,
                      // fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow:  [
                            BoxShadow(
                              color: primaryGray,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: -2.0,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/profile.png',
                            // height: 25,
                            scale: 3.5,
                            color: blue),
                      ),
                    ),
                    Text('  Lorem ipsum dolor sit amet, dolor sit\n  adipiscing elit',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                        fontSize: 12,
                        // fontWeight: FontWeight.bold
                      ),)
                  ],),
                  SizedBox(height: 10,),
                  Text('           23hrs ago',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                      fontSize: 12,
                      // fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              SizedBox(height: 20,),
               Text('Yesterday',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow:  [
                            BoxShadow(
                              color: primaryGray,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: -2.0,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/profile.png',
                            // height: 25,
                            scale: 3.5,
                            color: blue),
                      ),
                    ),
                    Text('  Lorem ipsum dolor sit amet, dolor sit\n  adipiscing elit',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                        fontSize: 12,
                        // fontWeight: FontWeight.bold
                      ),)
                  ],),
                  SizedBox(height: 10,),
                  Text('           15.04.2022  .  18:21',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                      fontSize: 12,
                      // fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow:  [
                            BoxShadow(
                              color: primaryGray,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: -2.0,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/profile.png',
                            // height: 25,
                            scale: 3.5,
                            color: blue),
                      ),
                    ),
                    Text('  Lorem ipsum dolor sit amet, dolor sit\n  adipiscing elit',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                        fontSize: 12,
                        // fontWeight: FontWeight.bold
                      ),)
                  ],),
                  SizedBox(height: 10,),
                  Text('           1404.2022  .  20:00',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                      fontSize: 12,
                      // fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              SizedBox(height: 10,),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Row(children: [
              //       Padding(
              //         padding: const EdgeInsets.only(bottom: 15),
              //         child: Container(
              //           height: 35,
              //           width: 35,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(100),
              //             boxShadow:  [
              //               BoxShadow(
              //                 color: primaryGray,
              //               ),
              //               const BoxShadow(
              //                 color: Colors.white,
              //                 spreadRadius: -2.0,
              //                 blurRadius: 2.0,
              //               ),
              //             ],
              //           ),
              //           child: Image.asset('assets/images/profile.png',
              //               // height: 25,
              //               scale: 3.5,
              //               color: blue),
              //         ),
              //       ),
              //       Text('  Lorem ipsum dolor sit amet, dolor sit\n  adipiscing elit',
              //         style: GoogleFonts.poppins(
              //           textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
              //           fontSize: 12,
              //           // fontWeight: FontWeight.bold
              //         ),)
              //     ],),
              //     SizedBox(height: 10,),
              //     Text('           1 min ago',
              //       style: GoogleFonts.poppins(
              //         textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
              //         fontSize: 12,
              //         // fontWeight: FontWeight.bold
              //       ),)
              //   ],
              // ),
              // SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
