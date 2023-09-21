import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../res/card_no_input_formate.dart';
import '../../res/colour.dart';
import '../../res/loader_dialog.dart';
import '../../view_model/card_controller/add_card_controller.dart';
import '../../view_model/card_controller/card_list_controller.dart';
import '../notification/notification_screen.dart';
import 'manage_card-red.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  AddCardController cardAddController = Get.put(AddCardController());
  CardListController cardListController = Get.put(CardListController());
  GlobalKey<FormState> formKey = GlobalKey();

  bool checkboxValue = false;
  final con = FlipCardController();
  final con1 = FlipCardController();
  final cong = GestureFlipCardController();
  final cong1 = GestureFlipCardController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: const Padding(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Set the desired color here
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Add New Card",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    letterSpacing: 0.5),
                fontSize: 16)),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
            },
            child: Image.asset(
              'assets/images/Notification1.png',
              // height: 25,
              scale: 0.89,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // AppBar(
            //   iconTheme: const IconThemeData(
            //     color: Colors.black, // Set the desired color here
            //   ),
            //   automaticallyImplyLeading: true,
            //   elevation: 0,
            //   backgroundColor: Colors.white,
            //   title:  Text(
            //     "Add New Card",
            //       style: GoogleFonts.poppins(
            //           textStyle: const TextStyle(
            //               fontWeight: FontWeight.w400,
            //               color: Colors.black, letterSpacing: 0.5),
            //           fontSize: 16)
            //   ),
            //   actions: [
            //     GestureDetector(
            //       onTap: (){
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const NotificationScreen()));
            //       },
            //       child: Image.asset('assets/images/Notification1.png',
            //         // height: 25,
            //         scale: 0.89,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: primaryGray,
              child: Container(
                // height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dan Sullivan',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  letterSpacing: 0.5),
                              fontSize: 16)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Daniel S. Sullivan, born Nov 13, 1964, is an Alaska Senator. Graduating from Culver Military Academy, Harvard, and Georgetown...',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  letterSpacing: 0.5),
                              fontSize: 12)),
                      // Image.asset(
                      //   'assets/images/Group 2497.png',
                      //   // height: 100,
                      //   fit: BoxFit.cover,
                      // ),
                      Container(
                        color: Colors.transparent,
                        height: 340,
                        width: size.width,
                        child: Stack(
                          children: [
                            GestureFlipCard(
                              axis: FlipAxis.vertical,
                              enableController: true,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              // axis: FlipAxis.vertical,
                              controller: cong1,
                              frontWidget: Center(
                                child: SizedBox(
                                  width: size.width,
                                  height: 300,
                                  child: Image.asset(
                                    'assets/images/flipback.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              backWidget: SizedBox(
                                  width: size.width,
                                  height: 300,
                                  child: Image.asset(
                                    'assets/images/flipfront.png',
                                    fit: BoxFit.contain,
                                  )),
                            ),
                            Positioned(
                              bottom: 50,
                              right: 30,
                              child: GestureDetector(
                                onTap: () {
                                  cong.flipcard();
                                  cong1.flipcard();
                                },
                                child: GestureFlipCard(
                                  // rotateSide: RotateSide.left,
                                  // onTapFlipping: true,
                                  axis: FlipAxis.vertical,
                                  enableController: true,
                                  animationDuration:
                                      const Duration(milliseconds: 1000),
                                  // axis: FlipAxis.vertical,
                                  controller: cong,
                                  frontWidget: Stack(
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          width: size.width,
                                          height: 300,
                                          child: Image.asset(
                                            'assets/images/flipfront.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 250,
                                        child: IconButton(
                                          onPressed: () {
                                            starController.setStar(
                                                starController.starBool.value);
                                          },
                                          icon: Obx(
                                            () => Image.asset(
                                              'assets/images/Star 2.png',
                                              // fit: BoxFit.contain,
                                              height: 20,
                                              color:
                                                  starController.starBool.value
                                                      ? Colors.amber
                                                      : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  backWidget: Stack(
                                    children: [
                                      SizedBox(
                                          width: size.width,
                                          height: 300,
                                          child: Image.asset(
                                            'assets/images/flipback.png',
                                            fit: BoxFit.contain,
                                          )),
                                      Positioned(
                                        top: 15,
                                        left: 250,
                                        child: IconButton(
                                          onPressed: () {
                                            starController.setStar(
                                                starController.starBool.value);
                                          },
                                          icon: Obx(
                                            () => Image.asset(
                                              'assets/images/Star 2.png',
                                              // fit: BoxFit.contain,
                                              height: 20,
                                              color:
                                                  starController.starBool.value
                                                      ? Colors.amber
                                                      : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   top: 10,
                            //   left: 160,
                            //   child: IconButton(
                            //     onPressed: (){},
                            //     icon: Image.asset(
                            //       'assets/images/Star 2.png',
                            //       // fit: BoxFit.contain,
                            //       height: 20,
                            //       color: Colors.amber,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Container(
                height: size.height / 2.8,
                decoration: BoxDecoration(
                  color: primaryGray,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                ),
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 180),
                          child: Text(
                            'Card Number',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black, letterSpacing: 0.3),
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                              controller:
                                  cardAddController.addCardController.value,
                              // maxLength: 16,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'please enter card number'),
                              ]),
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                // allow only  digits
                                // custom class to format entered data from textField
                                LengthLimitingTextInputFormatter(12)
                                // restrict user to enter max 16 characters
                              ],
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: 'xxxx xxxx xxxx',
                                hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 0.3),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                fillColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                filled: true,
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
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.0),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 190),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (Set states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return Colors.white;
                                    }
                                    return Colors.white;
                                  }),
                                  checkColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  value: checkboxValue,
                                  onChanged: (val) {
                                    setState(() {
                                      checkboxValue = !checkboxValue;
                                    });
                                  }),
                              Text(
                                'Save Card',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 0.3),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.grey
                                      ],
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
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      showLoaderDialog(context);
                                      cardAddController.addCardApi();
                                      cardListController.cardListApi();
                                    }
                                  },
                                  child: cardAddController.loading.value
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          'Add Card',
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 0.3),
                                              fontSize: 16),
                                        ))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final StarController starController = Get.put(StarController());
}
