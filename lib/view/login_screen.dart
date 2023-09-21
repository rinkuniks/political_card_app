import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/view/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../master_url/master_url.dart';
import '../res/colour.dart';
import '../res/loader_dialog.dart';
import '../view_model/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController logController = Get.put(LoginController());
  GlobalKey<FormState> formKey = GlobalKey();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryGray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Container(
                decoration:  BoxDecoration(
                  color: primaryGray,
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(80)),
                ),
                height: 70,
              ),
            ),
            Container(
              // height: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Form(
                key: formKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/front_logo.png',
                      height: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Hello Again!',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, letterSpacing: 0.5),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "Welcome back you've\n been missed!",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: size.width / 1.3,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow:  [
                            BoxShadow(
                              // color: Colors.black12,
                              color: primaryGray,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: -3.0,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.disabled,
                          // textAlign: TextAlign.center,
                          controller: logController.emailController.value,
                          textAlignVertical: TextAlignVertical.center,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: '* required'),
                            EmailValidator(
                                errorText: 'Enter correct email'),
                            // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                            //     errorText: 'passwords must have at least one special character'),
                          ]),

                          decoration: InputDecoration(

                            hintText: 'Email',
                            contentPadding: const EdgeInsets.only(left: 25),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                )),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 0.0),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: size.width / 1.3,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow:  [
                            BoxShadow(
                              // color: Colors.black12,
                              color: primaryGray,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              spreadRadius: -3.0,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.disabled,
                          controller: logController.passwordController.value,
                          obscureText: isPasswordVisible ? false : true,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: '* required'),
                            // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                            //     errorText: 'passwords must have at least one special character'),
                          ]),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: isPasswordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () => setState(() =>
                              isPasswordVisible = !isPasswordVisible),
                            ),
                            hintText: 'Password',
                            contentPadding:
                                const EdgeInsets.only(left: 25, right: 20),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                )),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 0.0),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                                activeColor: Colors.black,
                                value: isChecked,
                                onChanged: remember
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(color: blue,
                              fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              // forgetPassword();
                            },
                            child:  Text(
                              'Forgot password',
                              style: TextStyle(color: blue),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),


                         Container(
                            height: 45,
                            width: size.width / 1.8,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [Colors.black38, Colors.black],
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
                                  if (formKey.currentState!.validate()) {
                                    showLoaderDialog(context);
                                    logController.loginApi();
                                  }
                                },
                                child:
                                // logController.loading.value?
                                // const SizedBox(
                                //   height: 20,
                                //   width: 20,
                                //   child: CircularProgressIndicator(
                                //     strokeWidth: 2,
                                //     color: Colors.white,
                                //   ),
                                // ):
                                Text(
                                  'Login',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.white, letterSpacing: 0.5),
                                      fontSize: 15),
                                ))),


                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Container(
                // height: 200,
                decoration:  BoxDecoration(
                  color: primaryGray,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.white, Colors.black],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Or continue with'),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.white, Colors.black],
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow:  [
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
                              child: Image.asset(
                                'assets/images/google_logo.png',
                                height: 50,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow:  [
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
                              child: Image.asset(
                                'assets/images/apple_logo.png',
                                height: 50,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow:  [
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
                              child: Image.asset(
                                'assets/images/facebook_logo.png',
                                height: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Don't have account? "),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()),
                                );
                              },
                              child:  Text('Sign up',
                                  style: TextStyle(color: blue)))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    loadUserEmailPassword();
    super.initState();
  }
  bool isChecked = false;
  void remember (value) {
    isChecked = value;
    SharedPreferences.getInstance().then(
          (remMe) {
            remMe.setBool("remember_me", value);
            remMe.setString('emailRemMe', logController.emailController.value.text);
            remMe.setString('passwordRemMe', logController.passwordController.value.text);
      },
    );
    setState(() {
      isChecked = value;
    });
  }
  void loadUserEmailPassword() async {
    try {
      SharedPreferences remMe = await SharedPreferences.getInstance();
      var email = remMe.getString("emailRemMe") ?? "";
      var password = remMe.getString("passwordRemMe") ?? "";
      var rememberMe = remMe.getBool("remember_me") ?? false;
      if (rememberMe) {
        setState(() {
          isChecked = true;
        });
        logController.emailController.value.text = email;
        logController.passwordController.value.text = password;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  Future<void> forgetPassword() async {
    if (!await launchUrl(Uri.parse(MasterUrl.forgetPasswordLink),
        mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch ${MasterUrl.forgetPasswordLink}');
    }
  }
}
