import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/res/colour.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryGray,
        appBar:  AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, // Set the desired color here
          ),
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: primaryGray,
          title:  Text(
            "Frequently Asked Question :",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                fontSize: 16,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            FAQ(
              question: "Lorem ipsum dolor sit amet?",
              queStyle:  GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
            fontWeight: FontWeight.w600,
            fontSize: 16
        ),
              answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ansStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
            fontSize: 14,
                fontWeight: FontWeight.w400,
        ),
              ansDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              queDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            FAQ(
              question: "Lorem ipsum dolor sit amet?",
              queStyle:  GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
              answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ansStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              ansDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              queDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            FAQ(
              question: "Lorem ipsum dolor sit amet?",
              queStyle:  GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
              answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ansStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              ansDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              queDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            FAQ(
              question: "Lorem ipsum dolor sit amet?",
              queStyle:  GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
              answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ansStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              ansDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              queDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            FAQ(
              question: "Lorem ipsum dolor sit amet?",
              queStyle:  GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
              answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ansStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              ansDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              queDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            FAQ(
              question: "Lorem ipsum dolor sit amet?",
              queStyle:  GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
              answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ansStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              ansDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              queDecoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
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
                }, child:  Text('Submit',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
                      fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),))),

          ]),
        ),
      ),
    );
  }
}

String data = """"
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
""";
