import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/res/colour.dart';

import '../notification/notification_screen.dart';
import 'coming_soon_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool checkboxValue = false;
  bool checkboxValue1 = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: AppBar(
                    iconTheme: const IconThemeData(
                      color: Colors.black, // Set the desired color here
                    ),
                    automaticallyImplyLeading: true,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    title:  Text(
                      "Acquire to Start Quiz",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.black,),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
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
                  height: 30,
                ),
                Container(
                  color: primaryGray,
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                      ),
                    ),

                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Container(
                    height: size.height/1.3,
                    decoration:  BoxDecoration(
                      color: primaryGray,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                      ),
                    ),

                  ),
                ),
              ],
            ),
            Positioned(
              top: 100,
              left: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComingSoonScreen()));
                    },
                    child: Image.asset(
                      'assets/images/Rectangle 647.png',
                      // height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                          fillColor: MaterialStateProperty.resolveWith(
                                  (Set states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.white;
                                }
                                return Colors.white;
                              }),
                          checkColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          value: checkboxValue,
                          onChanged: (val) {
                            setState(() {
                              checkboxValue = !checkboxValue;
                            });
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child:  Text(
                            'Lorem ipsum',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black,),
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          )),
                    ],
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComingSoonScreen()));
                    },
                    child: Image.asset(
                      'assets/images/Group 2496.png',
                      // height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                          fillColor: MaterialStateProperty.resolveWith(
                                  (Set states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.white;
                                }
                                return Colors.white;
                              }),
                          checkColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          value: checkboxValue1,
                          onChanged: (val) {
                            setState(() {
                              checkboxValue1 = !checkboxValue1;
                            });
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child:  Text(
                            'Lorem ipsum',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black,),
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
