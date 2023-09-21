import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/res/colour.dart';

class PrivacyPolicies extends StatelessWidget {
  const PrivacyPolicies({super.key});


  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      backgroundColor: primaryGray,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, // Set the desired color here
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: primaryGray,
        title:  Text(
          "Privacy Policy",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
              fontSize: 16,
              fontWeight: FontWeight.w400
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AdaptiveScrollbar(
          controller: controller,
          scrollToClickDelta: 75,
          scrollToClickFirstDelay: 200,
          scrollToClickOtherDelay: 50,
          width: 15,
          sliderHeight: 100,
          // sliderChild: Icon(Icons.hourglass_full_outlined),
          sliderDecoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          underSpacing: const EdgeInsets.all(3),

          underDecoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          sliderActiveDecoration: const BoxDecoration(
              color: Color.fromRGBO(206, 206, 206, 100),
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          underColor: Colors.black,
          child: SingleChildScrollView(
            controller: controller,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('• OverView',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        const SizedBox(height: 10,),
                        Container(

                          width: 300,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white70)),
                          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                                fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('• Consent and Information\n   Collection and Use',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        const SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(8),
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white70)),
                          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.black, Colors.black38],
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
                      }, child:  Text('Understood',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
                            fontSize: 16
                        ),))),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
