import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/view/quiz/screens/quiz/quiz_screen.dart';

import '../../res/colour.dart';
import '../notification/notification_screen.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  primaryGray,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppBar(
                    iconTheme: const IconThemeData(
                      color: Colors.black, // Set the desired color here
                    ),
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor:  primaryGray,
                    title: const Text(
                      " ",
                      style: TextStyle(color: Colors.black),
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
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 308,
                  width: 312,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:  [
                      BoxShadow(
                        color: primaryGray,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2.0,
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                child: Text('ARE YOU AS\n SMART AS YOU\n THINK YOU\n ARE?',
                textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.3),
                      fontSize: 32,
                      fontWeight: FontWeight.w800
                  ),),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Take our monthly quiz to find out',style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.3),
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(
                  height: 15,
                ),
                Container(
                  // width: 256,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        // backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen()));

                      },
                      child: Text('COMING SOON',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Colors.white,),
                            fontSize: 32,
                            fontWeight: FontWeight.w400
                        ),)
                  ),
                ),

              ],
            ),
            Positioned(
              height: 320,
              left: 100,
              child: Row(children: [
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.black, Colors.black38],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                      ),
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
                SizedBox(width: 30,),
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.black, Colors.black38],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                      ),
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
