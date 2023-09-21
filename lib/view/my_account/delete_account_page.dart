import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/colour.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
             Text('Delete Account ?',
              style: GoogleFonts.poppins(
                  textStyle:  TextStyle(
                      color: Colors.black, letterSpacing: 0.3),
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),),
              const SizedBox(height: 20,),
               Text('Are you sure you want to delete your account?\n'
                  'Deleting your account will lost all your Data.',
                style: GoogleFonts.poppins(
                    textStyle:  TextStyle(
                        color: Colors.black, letterSpacing: 0.3),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),),
              SizedBox(
                height: size.height/1.7,
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
                              shadowColor:  primaryGray,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                              side: const BorderSide(
                                color: Colors.transparent,
                              )
                          ),
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) =>  const LoginScreen()),
                            // );
                          }, child:  Text('Cancel',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                            fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),))
                  ),
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
                      }, child:  Text('Allow',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
