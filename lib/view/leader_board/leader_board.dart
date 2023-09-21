import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/colour.dart';
import '../notification/notification_screen.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height*1.5,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: primaryGray,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.black, // Set the desired color here
              ),
              automaticallyImplyLeading: true,
              elevation: 0,
              backgroundColor: primaryGray,
              title:  Padding(
                padding: const EdgeInsets.fromLTRB(20, 35, 0, 2),
                child: Text(
                  "LeaderBoard",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.3),
                        fontSize: 30,
                      fontWeight: FontWeight.bold
                    )
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
              bottom: PreferredSize(

                preferredSize: const Size.fromHeight(60),
                child: Container(

                  width: 325,

                  decoration:  BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                  ),
                  child:  TabBar(
                    indicatorPadding: const EdgeInsets.all(5),
                    indicator: BoxDecoration(
                        color: primaryGray,
                        borderRadius: BorderRadius.circular(20)),
                    tabs:   [
                      SizedBox(
                          height: 30,
                          // width: 100,
                          child: Tab(child: Text('All Time',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black,),
                                fontSize: 12,
                                fontWeight: FontWeight.w300
                            ),))),
                      SizedBox(
                          height: 30,
                          // width: 100,
                          child: Tab(child: Text('This Week',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black,),
                                fontSize: 12,
                                fontWeight: FontWeight.w300
                            ),))),
                      SizedBox(
                          height: 30,
                          // width: 100,
                          child: Tab(child: Text('This Month',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black,),
                                fontSize: 12,
                                fontWeight: FontWeight.w300
                            ),))),

                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              color: Colors.white,
              child: TabBarView(
                  children:[
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            // height: 230,
                            height: size.height/3.9,
                            width: size.width,
                            decoration:  BoxDecoration(
                                color: primaryGray,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                              boxShadow: [
                                BoxShadow(
                                    color: darkBlue
                                ),
                                const BoxShadow(
                                  color: Color(0xFFb1b1b1),
                                  spreadRadius: 6.0,
                                  blurRadius: 16.0,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    // height: 200,
                                    height: size.height/3.5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                    color: Colors.white,
                                        borderRadius: BorderRadius.circular(45)),
                                        // height: 120,
                                        height: size.height/6.8,
                                          // width: 100,
                                          width: size.width/3.9,
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                               Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                               Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 26,),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          height: size.height/5.6,
                                          // width: 100,
                                          width: size.width/3.9,
                                          // height: 150,
                                          // width: 100,
                                          decoration: BoxDecoration(
                                    color: Colors.white,
                                        borderRadius: BorderRadius.circular(45)),
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                               Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                              Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 37,),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          height: size.height/6.8,
                                          // width: 100,
                                          width: size.width/3.9,
                                          // height: 120,
                                          // width: 100,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                    color: Colors.white,
                                        borderRadius: BorderRadius.circular(45)),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                               Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                              Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 25,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    // top: 15,
                                    top: size.height/45,
                                    // left: 50,
                                    left: size.width/7.7,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 22,),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    // left: 160,
                                    left: size.width/2.45,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 25,),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // top: 15,
                                    top: size.height/45,
                                    // left: 280,
                                    left: size.width/1.4,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 22,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 15,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ListTile(
                                          leading: Padding(
                                            padding: const EdgeInsets.only(bottom: 8),
                                            child: Text("$index",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(color: Colors.white,),
                                                  fontSize: 7.4,
                                                  fontWeight: FontWeight.w600
                                              ),),
                                          ),
                                          horizontalTitleGap: 10,
                                          minLeadingWidth: 10,

                                        contentPadding: const EdgeInsets.only(left: 12,right: 12),
                                          titleAlignment: ListTileTitleAlignment.center,
                                          title :  ListTile(
                                            titleAlignment: ListTileTitleAlignment.center,
                                            leading: Padding(
                                              padding: const EdgeInsets.only(bottom: 12),
                                              child:   CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.white,
                                                child: Container(
                                                  height: 27,
                                                  width: 27,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius: BorderRadius.circular(100),
                                                    border: Border.all(color: Colors.black)
                                                  ),
                                                  child: const Icon(Icons.person_2_rounded,
                                                    color: Colors.black,
                                                  size: 20,),
                                                ),
                                              )

                                            ),
                                            title:  Padding(
                                              padding: EdgeInsets.only(bottom: 12),
                                              child: Text("Lorem Ipsum",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.white,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                            ),
                                          ),

                                          trailing :  Padding(
                                            padding: EdgeInsets.only(bottom: 8),
                                            child: Text(
                                              "0000",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(color: Colors.white,),
                                                  fontSize: 12,
                                                  letterSpacing: 1.9,
                                                  fontWeight: FontWeight.w900
                                              ),
                                            ),
                                          ),

                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            // height: 230,
                            height: size.height/3.9,
                            width: size.width,
                            decoration:  BoxDecoration(
                              color: primaryGray,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: darkBlue
                                ),
                                const BoxShadow(
                                  color: Color(0xFFb1b1b1),
                                  spreadRadius: 6.0,
                                  blurRadius: 16.0,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    // height: 200,
                                    height: size.height/3.5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(45)),
                                          // height: 120,
                                          height: size.height/6.8,
                                          // width: 100,
                                          width: size.width/3.9,
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                              Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 26,),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          height: size.height/5.6,
                                          // width: 100,
                                          width: size.width/3.9,
                                          // height: 150,
                                          // width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(45)),
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                              Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 37,),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          height: size.height/6.8,
                                          // width: 100,
                                          width: size.width/3.9,
                                          // height: 120,
                                          // width: 100,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(45)),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                              Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 25,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    // top: 15,
                                    top: size.height/45,
                                    // left: 50,
                                    left: size.width/7.7,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 22,),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    // left: 160,
                                    left: size.width/2.45,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 25,),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // top: 15,
                                    top: size.height/45,
                                    // left: 280,
                                    left: size.width/1.4,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 22,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 15,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ListTile(
                                        leading: Padding(
                                          padding: const EdgeInsets.only(bottom: 8),
                                          child: Text("$index",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(color: Colors.white,),
                                                fontSize: 7.4,
                                                fontWeight: FontWeight.w600
                                            ),),
                                        ),
                                        horizontalTitleGap: 10,
                                        minLeadingWidth: 10,

                                        contentPadding: const EdgeInsets.only(left: 12,right: 12),
                                        titleAlignment: ListTileTitleAlignment.center,
                                        title :  ListTile(
                                          titleAlignment: ListTileTitleAlignment.center,
                                          leading: Padding(
                                              padding: const EdgeInsets.only(bottom: 12),
                                              child:   CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.white,
                                                child: Container(
                                                  height: 27,
                                                  width: 27,
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(color: Colors.black)
                                                  ),
                                                  child: const Icon(Icons.person_2_rounded,
                                                    color: Colors.black,
                                                    size: 20,),
                                                ),
                                              )

                                          ),
                                          title:  Padding(
                                            padding: EdgeInsets.only(bottom: 12),
                                            child: Text("Lorem Ipsum",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(color: Colors.white,),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300
                                              ),),
                                          ),
                                        ),

                                        trailing :  Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            "0000",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(color: Colors.white,),
                                                fontSize: 12,
                                                letterSpacing: 1.9,
                                                fontWeight: FontWeight.w900
                                            ),
                                          ),
                                        ),

                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            // height: 230,
                            height: size.height/3.9,
                            width: size.width,
                            decoration:  BoxDecoration(
                              color: primaryGray,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: darkBlue
                                ),
                                const BoxShadow(
                                  color: Color(0xFFb1b1b1),
                                  spreadRadius: 6.0,
                                  blurRadius: 16.0,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    // height: 200,
                                    height: size.height/3.5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(45)),
                                          // height: 120,
                                          height: size.height/6.8,
                                          // width: 100,
                                          width: size.width/3.9,
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                              Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 26,),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          height: size.height/5.6,
                                          // width: 100,
                                          width: size.width/3.9,
                                          // height: 150,
                                          // width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(45)),
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                              Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 37,),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          height: size.height/6.8,
                                          // width: 100,
                                          width: size.width/3.9,
                                          // height: 120,
                                          // width: 100,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(45)),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('0000',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900
                                                ),),
                                              Text('Lorem Ipsum',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(color: Colors.black,),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              Image.asset('assets/images/Group 2354.png',
                                                height: 25,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    // top: 15,
                                    top: size.height/45,
                                    // left: 50,
                                    left: size.width/7.7,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 22,),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    // left: 160,
                                    left: size.width/2.45,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 25,),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // top: 15,
                                    top: size.height/45,
                                    // left: 280,
                                    left: size.width/1.4,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: Colors.grey,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Icon(Icons.person_2_rounded,
                                          color: Colors.white,
                                          size: 22,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 15,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ListTile(
                                        leading: Padding(
                                          padding: const EdgeInsets.only(bottom: 8),
                                          child: Text("$index",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(color: Colors.white,),
                                                fontSize: 7.4,
                                                fontWeight: FontWeight.w600
                                            ),),
                                        ),
                                        horizontalTitleGap: 10,
                                        minLeadingWidth: 10,

                                        contentPadding: const EdgeInsets.only(left: 12,right: 12),
                                        titleAlignment: ListTileTitleAlignment.center,
                                        title :  ListTile(
                                          titleAlignment: ListTileTitleAlignment.center,
                                          leading: Padding(
                                              padding: const EdgeInsets.only(bottom: 12),
                                              child:   CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.white,
                                                child: Container(
                                                  height: 27,
                                                  width: 27,
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(color: Colors.black)
                                                  ),
                                                  child: const Icon(Icons.person_2_rounded,
                                                    color: Colors.black,
                                                    size: 20,),
                                                ),
                                              )

                                          ),
                                          title:  Padding(
                                            padding: EdgeInsets.only(bottom: 12),
                                            child: Text("Lorem Ipsum",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(color: Colors.white,),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300
                                              ),),
                                          ),
                                        ),

                                        trailing :  Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            "0000",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(color: Colors.white,),
                                                fontSize: 12,
                                                letterSpacing: 1.9,
                                                fontWeight: FontWeight.w900
                                            ),
                                          ),
                                        ),

                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),

            ),

          ),
        ),
      ),
    );
  }
}
