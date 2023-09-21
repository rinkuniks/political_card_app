import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../res/colour.dart';
import '../../../notification/notification_screen.dart';
import '../../controllers/question_controller.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        title: Padding(
          padding: const EdgeInsets.only(left: 30,top: 30),
          child: Text('Quiz',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.3),
                  fontSize: 30,
                  fontWeight: FontWeight.w900
              )),
        ),
        automaticallyImplyLeading: false,
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
      body: Body(),
    );
  }
}
