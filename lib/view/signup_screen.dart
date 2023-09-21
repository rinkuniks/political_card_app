import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../res/colour.dart';
import '../view_model/signup_controller.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signupController = Get.put(SignUpController());
  bool checkboxValue = false;
  GlobalKey<FormState> formKey = GlobalKey();
   bool _isPasswordVisible = false;

  void signUpFun(){
    if (formKey.currentState!.validate()) {
      signupController.signUpApi();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryGray,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryGray,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(80)),
                    ),
                    height: 80,
                  ),
                ),
                Container(
                  // height: 580,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
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
                              controller: signupController.firstName.value,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Required"),
                              ]),
                              decoration: InputDecoration(
                                hintText: 'First Name*',
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
                          padding: const EdgeInsets.all(6.0),
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
                              controller: signupController.lastName.value,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Required"),
                              ]),
                              decoration: InputDecoration(
                                hintText: 'Last Name*',
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
                          padding: const EdgeInsets.all(6.0),
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
                              controller: signupController.email.value,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Required"),
                                EmailValidator(
                                    errorText:
                                    "Please enter correct email"),
                              ]),
                              decoration: InputDecoration(
                                hintText: 'E-mail Address',
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
                          padding: const EdgeInsets.all(6.0),
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
                                const BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: -3.0,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.disabled,
                              controller: signupController.mobile.value,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Required"),
                              ]),
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: 'Mobile Number',
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
                          padding: const EdgeInsets.all(6.0),
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
                              controller: signupController.password.value,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Required"),
                              ]),
                              decoration: InputDecoration(
                                hintText: 'Password',
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
                          padding: const EdgeInsets.all(6.0),
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
                              controller: signupController.confirmPassword.value,
                              obscureText: _isPasswordVisible ? false : true,
                              validator: (reEnter){
                                if(reEnter!.isEmpty) return "* Required";
                                if(reEnter!=signupController.password.value.text) return " Password Not matched";
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: _isPasswordVisible
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () => setState(() =>
                                  _isPasswordVisible = !_isPasswordVisible),
                                ),
                                hintText: 'Confirm Password',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: checkboxValue,
                                onChanged: (val) {
                                  setState(() {
                                    checkboxValue = !checkboxValue;
                                  });
                                }),
                            const SizedBox(
                              width: 0,
                            ),
                            TextButton(
                                onPressed: null,
                                child: Text(
                                  'I accept all term and conditions',
                                  style: TextStyle(color: blue),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Container(
                              height: 45,
                              width: size.width / 1.8,
                              decoration: BoxDecoration(
                                  gradient:  LinearGradient(
                                      colors: [checkboxValue?Colors.black38:Colors.grey,checkboxValue? Colors.black:Colors.grey],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                  borderRadius: BorderRadius.circular(35)),
                              child: ElevatedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(35.0)),
                                  ),
                                  onPressed: checkboxValue?signUpFun:null,
                                  child: signupController.loading.value
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          'Sign up',
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 0.5),
                                              fontSize: 15),
                                        ))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Container(
                    // height: 200,
                    decoration: BoxDecoration(
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
                            height: 10,
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
                                              colors: [
                                            Colors.white,
                                            Colors.black
                                          ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight)),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text('or continue with'),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 2,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                            Colors.white,
                                            Colors.black
                                          ],
                                              begin: Alignment.centerRight,
                                              end: Alignment.centerLeft)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 60,
                                  width: 60,
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
                                  child: Image.asset(
                                    'assets/images/google_logo.png',
                                    scale: 1.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 60,
                                  width: 60,
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
                                  child: Image.asset(
                                    'assets/images/apple_logo.png',
                                    scale: 1.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 60,
                                  width: 60,
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
                                  child: Image.asset(
                                    'assets/images/facebook_logo.png',
                                    scale: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const LoginScreen()),
                                    );
                                  },
                                  child:  Text('Login',
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
            Positioned(
              // left: 165,
              left: size.width / 2.5,
              // top: 48,
              top: size.height / 20,
              child: Container(
                height: 75,
                width: 75,
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
                    scale: 1.7,
                    color: blue),
              ),
            ),
            Positioned(
              // left: 210,
              left: size.width / 1.85,
              top: size.height / 9,
              // top: 90,
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.add,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
