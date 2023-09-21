import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:political_card_app/res/colour.dart';
import 'package:political_card_app/view/start_screen.dart';
import 'package:political_card_app/view/stylish_tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  tokenSharedLog = prefs.getString('token');
  runApp(const MyApp());
}
String? tokenSharedLog;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xff0d1e2a)),
      ),
      // home: const SplashScreen(),
      home:  tokenSharedLog != null ? const StylishTabBarView1(0)  : const SplashScreen(),
    );
  }
}
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 3), () => checkLogin());
  }

  void checkLogin() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    // if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const StartScreen()),
      );
    // } else {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => LoginForm()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  primaryGray,
      child: Image.asset('assets/images/front_logo.png'),
    );
  }
}

