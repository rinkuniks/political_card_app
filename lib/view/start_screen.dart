import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/view/signup_screen.dart';
import 'package:political_card_app/view/stylish_tab_bar_view.dart';

import '../res/colour.dart';
import 'login_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int activeIndex=0;
  List imageSliders = [
    'assets/images/Rectangle_656.png',
    'assets/images/Rectangle_654.png',
    'assets/images/Rectangle_652.png',
    'assets/images/Rectangle_650.png',
  ];

  @override
  void initState() {
    getLocationPermission();
    super.initState();
  }
  Future<void> getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 662,
                    // height: size.height/1.3,
                    viewportFraction: 1.0,
                    aspectRatio: 0.8,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }
                ),
                items: [
                  for(var item in imageSliders ) ClipRRect(
                    borderRadius: const BorderRadius.only(
                        // bottomRight: Radius.circular(180)
                        bottomRight: Radius.circular(168)
                    ),
                    child: Stack(
                      children: [
                        Image.asset(item,
                          fit: BoxFit.fill,
                          // color: Colors.black.withOpacity(1.0),
                          color: primaryGray.withOpacity(1.0),
                          colorBlendMode: BlendMode.color,
                          width: size.width
                        ),
                        Positioned(
                          // top: 446,
                            top: size.height/2.2,
                            // left: size.width/8,
                            left: 24,
                            height: 200,
                            width: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Lorem Ipsum'.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900
                                    )),
                                const SizedBox(height: 10,),
                                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),)
                              ],
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                // top: 616,
                top: size.height/1.45,
                left: 24,
                // left: size.width/8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageSliders.map((url) {
                    int index = imageSliders.indexOf(url);
                    return Container(
                      width: 15.0,
                      height: 15.0,
                      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: activeIndex == index
                            ?  Colors.grey
                            :  Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                  top: 64,
                  left: 30,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.86,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/front_logo.png',
                          height: 50,),
                        SizedBox(
                          height: 50,
                          width: 71,
                          child: IconButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const LoginScreen()),
                              );
                            },
                            icon: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                Text('Skip '),
                                CircleAvatar(
                                  radius: 9.19,
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.arrow_forward_ios_outlined,
                                  color:Colors.white,
                                  size: 9.19,),
                                )
                                // Image.asset('assets/images/skip.png',
                                //   color: Colors.black.withOpacity(1.0),
                                //   colorBlendMode: BlendMode.color,
                                //   height: 50,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              // Positioned(
              //     top: 70,
              //     right: 300,
              //     child: Image.asset('assets/images/front_logo.png',
              //       height: 50,)
              // ),
              // Positioned(
              //     // top: 446,
              //     top: size.height/2.2,
              //     // left: size.width/8,
              //     left: 24,
              //     height: 200,
              //     width: 250,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text('Lorem Ipsum'.toUpperCase(),
              //             style: GoogleFonts.poppins(
              //                 textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
              //                 fontSize: 30,
              //               fontWeight: FontWeight.w900
              //             )),
              //         const SizedBox(height: 10,),
              //         Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
              //           style: GoogleFonts.poppins(
              //               textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.2),
              //               fontSize: 14,
              //             fontWeight: FontWeight.w400
              //           ),)
              //       ],
              //     )
              // ),
            ],
          ),
          const SizedBox(height: 70,),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const LoginScreen()),
                        );
                      }, child:  Text('Login',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
                        fontSize: 16
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>    const SignUpScreen()),
                    );
                  }, child:  Text('Sign Up',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
                        fontSize: 16
                    ),))),
            ],
          ),
        ],
      ),
    );
  }
}

