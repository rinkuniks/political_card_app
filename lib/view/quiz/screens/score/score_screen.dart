import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/colour.dart';
import '../../../notification/notification_screen.dart';
import '../../constants.dart';
import '../../controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    QuestionController _qnController = Get.put(QuestionController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          // Fluttter show the back button automatically
          title: Padding(
            padding: const EdgeInsets.fromLTRB(3, 10, 10, 10),
            child: Text('My Score',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.1),
                    fontSize: 19,
                    // fontWeight: FontWeight.bold
                )),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: primaryGray,
          elevation: 0,
          actions: [
            // ElevatedButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
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
        body: Stack(
          // fit: StackFit.expand,
          children: [
            // Image.asset("assets/images/bg.svg", fit: BoxFit.fill),
            Container(
              height: 270,
              width: size.width,
              decoration:  BoxDecoration(
                  color: primaryGray,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Spacer(flex: 3),
                  SizedBox(height: 20,),
                  Text(
                      " Your Score",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.1),
                          fontSize: 23,
                          fontWeight: FontWeight.w600
                      )
                  ),
                  Container(
                    height: 155,
                    width: 155,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white)
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                            "${_qnController.correctAns * 10*5}",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.1),
                                fontSize: 30,
                                fontWeight: FontWeight.w800
                            )
                        ),
                        Text(
                            "Points",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.1),
                                fontSize: 30,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ],
                    )
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 250,
                    width: size.width/1.2,
                    decoration: BoxDecoration(
                        color: lightGray,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: blue,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 17),
                                    child: Text.rich(
                                      TextSpan(
                                        text:
                                        "  100 %\n",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(color: blue),
                                        children: [
                                          TextSpan(
                                            text: "  Completion",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(color: blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 5,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: Text.rich(
                                      TextSpan(
                                        text:
                                        "  ${_qnController.questions.length}\n  Total\n",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(color: blue),
                                        children: [
                                          TextSpan(
                                            text: "  Questions",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(color: blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 35),
                                    child: Container(
                                      height: 5,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text:
                                      "  ${_qnController.correctAns} \n  Correct\n",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: Colors.green),
                                      children: [
                                        TextSpan(
                                          text: "  Answers",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 37,right: 10),
                                    child: Container(
                                      height: 5,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: red,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text.rich(

                                      TextSpan(
                                        text:
                                        "${_qnController.questions.length-_qnController.correctAns}\nWrong\n",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(color: red),
                                        children: [
                                          TextSpan(
                                            text: "Answers",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(color: red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(

                        "Lorem ipsum dolor sit amet, dolor sit adipiscing elit?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        )
                    ),
                  ),
                  Spacer(),
                  // Text(
                  //   "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .headline4
                  //       ?.copyWith(color: kSecondaryColor),
                  // ),
                  Spacer(flex: 3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
