import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/view/my_account/privacy_policies.dart';
import 'package:political_card_app/view/my_account/profile.dart';
import 'package:get/get.dart';
import '../../master_url/master_url.dart';
import '../../res/colour.dart';
import '../../view_model/logout_controller.dart';
import '../../view_model/my_account_controller/my_profile_controller.dart';
import '../notification/notification_screen.dart';
import 'delete_account_page.dart';
import 'faq_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  MyProfileController myProfileController = Get.put(MyProfileController());
  LogOutController logoutController = Get.put(LogOutController());

  @override
  void initState() {
    myProfileController.profileDetailsApi();
    super.initState();
  }

  void logOutDialog() {
    Get.defaultDialog(
        title: 'Do you want to Logout?',
        titleStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.5),
            fontSize: 18,
            fontWeight: FontWeight.w400),
        titlePadding: const EdgeInsets.only(top: 20),
        content: Padding(
          padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
          child: Text(
            'Are you sure you want to delete your account?',
            style: GoogleFonts.poppins(
                textStyle:
                const TextStyle(color: Colors.white, letterSpacing: 0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
        cancel: Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: primaryGray,
                ),
                const BoxShadow(
                  color: Colors.white,
                  spreadRadius: -3.0,
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shadowColor: primaryGray,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0)),
                    side: const BorderSide(
                      color: Colors.transparent,
                    )),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'No',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: 0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ))),
        confirm: Obx(
              () => Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.black, Colors.black38],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(35)),
              child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0)),
                  ),
                  onPressed: () {
                    logoutController.logOutApi();
                  },
                  child: logoutController.loading.value
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : Text(
                    'Yes',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white, letterSpacing: 0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ))),
        ),
        radius: 10.0);
  }

  void deleteAccountDialog() {
    Get.defaultDialog(
        title: 'Delete Account ?',
        content: Padding(
          padding: const EdgeInsets.fromLTRB(3, 3, 3, 100),
          child: Text('Are you sure you want to delete your account?\n'
              'Deleting your account will lost all your Data.',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.black, letterSpacing: 0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400
            ),),
        ),
        contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 25),
        cancel: Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: primaryGray,
                ),
                const BoxShadow(
                  color: Colors.white,
                  spreadRadius: -3.0,
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: OutlinedButton(

                style: OutlinedButton.styleFrom(
                    shadowColor: primaryGray,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0)),
                    side: const BorderSide(
                      color: Colors.transparent,
                    )
                ),
                onPressed: () {
                  Get.back();
                }, child: Text('Cancel',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Colors.black, letterSpacing: 0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),))
        ),
        confirm: Obx(() =>
            Container(
                height: 40,
                width: 130,
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
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0)),

                    ), onPressed: () {
                  logoutController.logOutApi();
                }, child: logoutController.loading.value ?
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ) : Text('Allow',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.white, letterSpacing: 0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),))),
        ),
        radius: 10.0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
              child: AppBar(
                iconTheme: const IconThemeData(
                  color: Colors.white, // Set the desired color here
                ),
                automaticallyImplyLeading: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text("My Profile", style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.black,),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (
                                  context) => const NotificationScreen()));
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
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                  const Profile()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 79,
                      width: 79,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: primaryGray,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            spreadRadius: -3.0,
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: Image.asset('assets/images/profile.png',
                          // height: 25,
                          scale: 1.4,
                          color: blue),
                    ),
                    const SizedBox(width: 15,),
                    Obx(() =>
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mr. ${myProfileController.profileFirstName
                                .toString()} ${myProfileController
                                .profileLastName.toString()}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.black, letterSpacing: 0.3),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),),
                            Text(myProfileController.profileEmail.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.black, letterSpacing: 0.3),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300
                              ),),
                          ],
                        ),
                    ),
                    const SizedBox(width: 20,),
                    const CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 8,),
                    )

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 40, right: 40, bottom: 8),
              child: Container(
                width: size.width / 1.3,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black12,
                      color: primaryGray,
                    ),
                    BoxShadow(
                      color: lightGray,
                      spreadRadius: -3.0,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: -3.0,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/Vector.png',
                      // height: 30,
                      scale: 2.8,
                      color: primaryGray,
                    ),
                  ),
                  title: Text('Settings',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>    const MyProfile(
                    //
                    //   )),
                    // );
                  },
                  trailing: const CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 8,),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                          color: Colors.transparent
                      )

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 40, right: 40, bottom: 8),
              child: Container(
                width: size.width / 1.3,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black12,
                      color: primaryGray,
                    ),
                    BoxShadow(
                      color: lightGray,
                      spreadRadius: -3.0,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: -3.0,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/Group 2506.png',
                      // height: 30,
                      scale: 2.8,
                      color: primaryGray,
                    ),
                  ),
                  title: Text('Privacy Policy',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>
                    //   const PrivacyPolicies(
                    //
                    //   )),
                    // );
                    _launchUrl();
                  },
                  trailing: const CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 8,),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                          color: Colors.black12
                      )

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 40, right: 40, bottom: 8),
              child: Container(
                width: size.width / 1.3,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black12,
                      color: primaryGray,
                    ),
                    BoxShadow(
                      color: lightGray,
                      spreadRadius: -3.0,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: -3.0,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/Group 2507.png',
                      // height: 30,
                      scale: 2.8,
                      color: primaryGray,
                    ),
                  ),
                  title: Text('FAQ',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>
                    //   const FAQScreen(
                    //
                    //   )),
                    // );
                    _launchUrl2();
                  },
                  trailing: const CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 8,),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                          color: Colors.black12
                      )

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 40, right: 40, bottom: 8),
              child: Container(
                width: size.width / 1.3,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      // color: Colors.black12,
                      color: primaryGray,
                    ),
                    BoxShadow(
                      color: lightGray,
                      spreadRadius: -3.0,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: -3.0,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/Group 2505.png',
                      // height: 30,
                      scale: 2.8,
                      color: primaryGray,
                    ),
                  ),
                  title: Text('T & C',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>    const MyProfile(
                    //
                    //   )),
                    // );
                  },
                  trailing: const CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 8,),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                          color: Colors.black12
                      )

                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 40, right: 40, bottom: 4),
              child: SizedBox(
                height: 50,
                width: size.width / 1.5,
                child: TextButton(
                  onPressed: () {
                    logOutDialog();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.transparent),
                      alignment: Alignment.centerLeft
                  ),
                  child: Text("Log Out", style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: 0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),),
                  // icon: const Icon(Icons.person,color: Colors.black,size: 25,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 40, right: 40, bottom: 8),
              child: SizedBox(
                height: 50,
                width: size.width / 1.5,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>    const DeleteAccountPage(
                    //
                    //   )),
                    // );
                    deleteAccountDialog();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.transparent),
                      alignment: Alignment.centerLeft
                  ),
                  child: Text("Delete Account", style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: 0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),),
                  // icon: const Icon(Icons.person,color: Colors.black,size: 25,),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(MasterUrl.privacyPoliciesLink),
        mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch ${MasterUrl.privacyPoliciesLink}');
    }
  }
  Future<void> _launchUrl2() async {
    if (!await launchUrl(Uri.parse(MasterUrl.faqLink),
        mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch ${MasterUrl.faqLink}');
    }
  }
  // _launchURL() async {
  //   const url = 'https://flutterdevs.com/';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}