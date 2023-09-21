import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../res/colour.dart';
import '../../view_model/logout_controller.dart';
import '../../view_model/my_account_controller/edit_profile.dart';
import '../../view_model/my_account_controller/my_profile_controller.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  MyProfileController myProfileController = Get.put(MyProfileController());
  LogOutController logoutController = Get.put(LogOutController());
  EditProfileController editProfileController =
      Get.put(EditProfileController());
  bool editBool = false;

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
          child: Text(
            'Are you sure you want to delete your account?\n'
            'Deleting your account will lost all your Data.',
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(color: Colors.black, letterSpacing: 0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
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
                    )),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Cancel',
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
                          'Allow',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white, letterSpacing: 0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ))),
        ),
        radius: 10.0);
  }

  late String currentAddress ;
  late Position currentPosition;
  late Placemark place;
  Future<Position> _determinePosition() async {


    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    try {
      List<Placemark> placeMarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

       place = placeMarks[0];

      setState(() {
        currentPosition = position;
        currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
      print('vbnvnv=====${currentAddress.isNotEmpty}');
     if(myProfileController.profileLocation.toString() == 'null'){
       myProfileController.profileLocation.value=place.locality.toString();
     }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    throw const FormatException();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.black, // Set the desired color here
              ),
              automaticallyImplyLeading: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                "Profile",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black, letterSpacing: 0.3),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        editBool = !editBool;
                      });
                      if (editBool == false) {
                        if (editProfileController
                                .firstNameController.value.text.isNotEmpty ||
                            editProfileController
                                .lastNameController.value.text.isNotEmpty ||
                            myProfileController.profileGender.value != '###' ||
                            editProfileController
                                .dobController.value.text.isNotEmpty ||
                            editProfileController
                                .locationController.value.text.isNotEmpty ||
                            currentAddress.isNotEmpty||
                            editProfileController
                                .mobileController.value.text.isNotEmpty) {
                          pGenderString = '###';
                          editProfileController.editProfileApi();
                        }
                      }
                    },
                    child: editBool
                        ? editProfileController.loading.value
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                'Update',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: blue, letterSpacing: 0.3),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              )
                        : Text(
                            'Edit',
                            style: GoogleFonts.poppins(
                                textStyle:
                                    TextStyle(color: blue, letterSpacing: 0.3),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 80,
              width: 80,
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
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child:   CircleAvatar(
          //     radius: 37,
          //     backgroundColor: Colors.white,
          //     child: Image.asset('assets/images/profile.png',
          //         height: 35,
          //         color: Color(0xFF0d1e2a)),
          //   ),
          // ),
          Container(
            height: 330,
            width: 300,
            padding: const EdgeInsets.only(
              top: 20,
            ),
            decoration: BoxDecoration(
                color: primaryGray,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: primaryGray)),
            child: Column(
              children: [
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    'First Name :',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: SizedBox(
                    height: 35,
                    width: 110,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller:
                          editProfileController.firstNameController.value,
                      // validator: MultiValidator([
                      //   EmailValidator(errorText: "Not Valid"),
                      // ]),
                      enabled: editBool,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 15, left: 10, right: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        filled: editBool,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        // hintText:
                        //     myProfileController.profileFirstName.toString(),
                          // hintStyle: GoogleFonts.poppins(
                          //     textStyle: const TextStyle(
                          //         color: Colors.black, letterSpacing: 0.3),
                          //     fontSize: 12,
                          //     fontWeight: FontWeight.w400),
                      ),

                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  // trailing: Text('Mr. ${myProfileController.profileFirstName.toString()}',
                  //   style: GoogleFonts.poppins(
                  //       textStyle: const TextStyle(
                  //           color: Colors.black, letterSpacing: 0.3),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400
                  //   ),),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    'Last Name :',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: SizedBox(
                    height: 35,
                    width: 110,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller:
                          editProfileController.lastNameController.value,
                      // validator: MultiValidator([
                      //   EmailValidator(errorText: "Not Valid"),
                      // ]),
                      enabled: editBool,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 15, left: 10, right: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        filled: editBool,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintText:
                            myProfileController.profileLastName.toString(),
                        hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, letterSpacing: 0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),

                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  // trailing: Text(myProfileController.profileLastName.toString(),
                  //   style: GoogleFonts.poppins(
                  //       textStyle: const TextStyle(
                  //           color: Colors.black, letterSpacing: 0.3),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400
                  //   ),),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    'Gender :',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: editBool ? Container(
                    height: 35,
                    width: 112,
                    child: DropdownButton(
                      alignment: AlignmentDirectional.centerEnd,
                      // Initial Value
                      value: myProfileController.profileGender.value
                                  .toString() !=
                              'null'
                          ? myProfileController.profileGender.value.toString()
                          : '',

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          enabled: editBool,
                          value: items,
                          child: Text(
                            items,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black, letterSpacing: 0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (newValue) {
                        setState(() {
                          myProfileController.profileGender.value = newValue!;
                          pGenderString = newValue;
                        });
                      },
                    ),
                    // DropDownTextField(
                    //   controller: editProfileController.genderController.value,
                    //   // isEnabled: drrop,
                    //   isEnabled: editBool,
                    //   textFieldDecoration : InputDecoration(
                    //       contentPadding: const EdgeInsets.only(top: 10,left: 59),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide:  const BorderSide(color: Colors.transparent),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide:   const BorderSide(color: Colors.transparent),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide:  const BorderSide(color: Colors.transparent),
                    //     ),
                    //     disabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide:  const BorderSide(color: Colors.transparent),
                    //     ),
                    //       filled: editBool,
                    //       fillColor: Colors.white,
                    //       focusColor: Colors.white,
                    //
                    //       hintText: myProfileController.profileGender.toString(),
                    //       hintStyle: GoogleFonts.poppins(
                    //           textStyle: const TextStyle(
                    //               color: Colors.black, letterSpacing: 0.3),
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w400
                    //       ),),
                    //   dropDownList: const [
                    //     DropDownValueModel(name: "male", value: "value1"),
                    //     DropDownValueModel(
                    //         name: "female", value: "value2"),
                    //     DropDownValueModel(name: "other", value: "value"),
                    //   ],
                    //   textStyle: GoogleFonts.poppins(
                    //   textStyle: const TextStyle(
                    //   color: Colors.black, letterSpacing: 0.3),
                    //   fontSize: 12,
                    //   fontWeight: FontWeight.w400),
                    //   dropDownItemCount: 3,
                    //
                    // ),
                  ): Container(
                    height: 35,
                    width: 112,
                    padding: const EdgeInsets.only(left: 12, top: 7),
                    child: Text(myProfileController.profileGender.value,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),),
                  ),
                  // trailing : Text(myProfileController.profileGender.toString(),
                  //   style: GoogleFonts.poppins(
                  //       textStyle: const TextStyle(
                  //           color: Colors.black, letterSpacing: 0.3),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400
                  //   ),),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    'DOB :',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: SizedBox(
                    height: 35,
                    width: 110,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: editProfileController.dobController.value,
                      // validator: MultiValidator([
                      //   EmailValidator(errorText: "Not Valid"),
                      // ]),
                      enabled: editBool,
                      readOnly: true,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 15, left: 10, right: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        filled: editBool,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: myProfileController.profileDob.value
                                    .toString() !=
                                'null'
                            ? myProfileController.profileDob.value.toString()
                            : '',
                        hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, letterSpacing: 0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),

                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black, letterSpacing: 0.3),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      onTap: () async {
                        DateTime? datePicker = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (datePicker != null) {
                          editProfileController.dobController.value.text =
                              DateFormat('yyyy-MM-dd').format(datePicker);
                        }
                      },
                    ),
                  ),
                  // trailing: Text(myProfileController.profileDob.toString(),
                  //   style: GoogleFonts.poppins(
                  //       textStyle: const TextStyle(
                  //           color: Colors.black, letterSpacing: 0.3),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400
                  //   ),),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    'Location :',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: SizedBox(
                    height: 35,
                    width: 110,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller:
                          editProfileController.locationController.value,
                      // validator: MultiValidator([
                      //   EmailValidator(errorText: "Not Valid"),
                      // ]),
                      enabled: editBool,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          alignment: Alignment.centerRight,
                          iconSize: 20,
                          onPressed: (){
                            _determinePosition();
                          },
                          icon: const Icon(Icons.location_on_outlined),
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 15, left: 10, right: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        filled: editBool,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        // hintText:
                            // myProfileController.profileLocation.toString() !=
                            //         'null'
                            //     ? myProfileController.profileLocation.toString()
                            //     : currentAddress.isNotEmpty?place.locality:'',
                        hintText: myProfileController.profileLocation.toString() !=
                                                            'null'
                                                        ? myProfileController.profileLocation.toString()
                                                        :'',
                        hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, letterSpacing: 0.1),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),

                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black, letterSpacing: 0.1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  // trailing: Text(myProfileController.profileLocation.toString(),
                  //   style: GoogleFonts.poppins(
                  //       textStyle: const TextStyle(
                  //           color: Colors.black, letterSpacing: 0.3),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400
                  //   ),),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    'Number :',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: SizedBox(
                    height: 35,
                    width: 110,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: editProfileController.mobileController.value,
                      // validator: MultiValidator([
                      //   EmailValidator(errorText: "Not Valid"),
                      // ]),
                      enabled: editBool,
                      maxLines: 2,
                      textAlign: TextAlign.start,

                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 15, left: 10, right: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        filled: editBool,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: myProfileController.profileMobile.toString(),
                        hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, letterSpacing: 0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),

                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black, letterSpacing: 0.3),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  // trailing: Text('+91 ${myProfileController.profileMobile.toString()}',
                  //   style: GoogleFonts.poppins(
                  //       textStyle: const TextStyle(
                  //           color: Colors.black, letterSpacing: 0.3),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400
                  //   ),),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: Text(
                    'Email :',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: SizedBox(
                    height: 35,
                    width: 110,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: editProfileController.emailController.value,
                      // validator: MultiValidator([
                      //   EmailValidator(errorText: "Not Valid"),
                      // ]),
                      enabled: false,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 15, left: 10, right: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        filled: false,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: myProfileController.profileEmail.toString(),
                        hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, letterSpacing: 0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),

                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  // trailing: Text(myProfileController.profileEmail.toString(),
                  //   style: GoogleFonts.poppins(
                  //       textStyle: const TextStyle(
                  //           color: Colors.black, letterSpacing: 0.3),
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400
                  //   ),),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          alignment: Alignment.centerLeft),
                      child: Text(
                        "Log Out",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, letterSpacing: 0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          alignment: Alignment.centerLeft),
                      child: Text(
                        "Delete Account",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, letterSpacing: 0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      // icon: const Icon(Icons.person,color: Colors.black,size: 25,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String pGenderString = '###';

  // List of items in our dropdown menu
  var items = [
    'male',
    'female',
    'other',
  ];
}
