import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:political_card_app/view/quiz/quiz.dart';
import '../view_model/card_controller/card_list_controller.dart';
import 'card/my_card.dart';
import 'home_screen.dart';
import 'leader_board/leader_board.dart';
import 'my_account/my_profile.dart';

class StylishTabBarView1 extends StatefulWidget {
  final int pageIndex;
  const StylishTabBarView1(this.pageIndex, {super.key});

  @override
  State<StylishTabBarView1> createState() => _StylishTabBarView1State();
}

class _StylishTabBarView1State extends State<StylishTabBarView1> {
  late final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  CardListController cardListController = Get.put(CardListController());

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const MyCard(),
      const Quiz(),
      const Leaderboard(),
      const MyProfile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/home.png',
          // height: 30,
          scale: 2.4,
          color: Colors.grey,
        ),
        // icon:  Image.asset('assets/images/home.png',color: Colors.white,),
        title: ("Home"),
        textStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
          fontSize: 15,
          // fontWeight: FontWeight.bold
        ),
        activeColorPrimary: CupertinoColors.black,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        // inactiveColorSecondary: CupertinoColors.black,
        // opacity: 0.9
      ),
      PersistentBottomNavBarItem(
        // onPressed: (context){
        //   cardListController.cardListApi();
        //   setState(() {
        //     _controller.index = 1;
        //   });
        // },
        icon: Image.asset(
          'assets/images/cards.png',
          // height: 30,
          scale: 2.4,
          color: Colors.grey,
        ),
        title: ("Card"),
        textStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
          fontSize: 15,
          // fontWeight: FontWeight.bold
        ),
        activeColorPrimary: const Color(0xff0d1e2a),
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/quiz.png',
          // height: 30,
          scale: 2.4,
          color: Colors.grey,
        ),
        title: ("Quiz"),
        textStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
          fontSize: 15,
          // fontWeight: FontWeight.bold
        ),
        activeColorPrimary: const Color(0xff0d1e2a),
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/progress.png',
          // height: 30,
          scale: 2.4,
          color: Colors.grey,
        ),
        title: ("Leaderboard"),
        textStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
          fontSize: 15,
          // fontWeight: FontWeight.bold
        ),
        activeColorPrimary: const Color(0xff0d1e2a),
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/profile.png',
          // height: 30,
          scale: 2.4,
          color: Colors.grey,
        ),
        title: ("My Account"),
        textStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.white, letterSpacing: 0.5),
          fontSize: 15,
          // fontWeight: FontWeight.bold
        ),
        activeColorPrimary: const Color(0xff0d1e2a),
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Do you want exit..press back button again.");

      print('hello');
      return Future.value(false);
    }
    print('hello1');
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller.index == 0) {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
            currentBackPressTime = now;
            Fluttertoast.showToast(msg: "Do you want exit..press back button again.");
            return Future.value(false);
          }
          SystemNavigator.pop();
          return Future.value(false);
        }
        return false;
      },
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),

        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style10, // Choose the nav bar style with this property.
      ),
    );
  }
}
