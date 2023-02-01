import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foode/controllers/auth_controller.dart';
import 'package:foode/view/pages/auth/upload_photo.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:foode/view/widgets/onunfocused_tap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FillBioPage extends StatefulWidget {
  const FillBioPage({super.key});

  @override
  State<FillBioPage> createState() => _FillBioPageState();
}

class _FillBioPageState extends State<FillBioPage> {
  TextEditingController fullname = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController passwor = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool value = false;
  bool visibilityOfpasswor = false;
  bool isFullNameEmpty = false;
  bool isNickNameEmpty = false;
  bool isPhoneNumberEmpty = false;
  bool isGenderEmpty = false;
  bool isDateOfBirthEmpty = false;
  bool isAddressEmpty = false;
  bool isPasswEmty = false;
  String initialvalue = 'Male';
  String datetext = '';
  var items = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnUnFocusTap(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.18, vertical: 8.18),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.82)),
                            color: Color.fromARGB(255, 234, 175, 194)),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffF43F5E),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Fill in your bio',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 26, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Text(
                    'This data will be displayed in your account profile for security',
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, top: 35),
                  child: Row(
                    children: [
                      Text(
                        'Full Name',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2C3A4B)),
                      ),
                      Text(
                        '*',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffDA1414)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    label: '',
                    onchange: (value) {
                      isFullNameEmpty = false;
                      setState(() {});
                    },
                    controller: fullname,
                    keyboardType: TextInputType.emailAddress,
                    hintext: 'Full Name',
                    onChange: (s) {},
                  ),
                ),
                isFullNameEmpty
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 24, top: 8, right: 24),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, bottom: 6, left: 36),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xffEBEEF2)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.error,
                                  color: Color(0xff394452),
                                ),
                              ),
                              Text(
                                'Please fill this field',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff394452)),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.only(left: 48, top: 35),
                  child: Row(
                    children: [
                      Text(
                        'Nick Name',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2C3A4B)),
                      ),
                      Text(
                        '*',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffDA1414)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    label: '',
                    onchange: (value) {
                      isNickNameEmpty = false;
                      setState(() {});
                    },
                    controller: nickname,
                    keyboardType: TextInputType.name,
                    hintext: 'Nick Name',
                    onChange: (s) {},
                  ),
                ),
                isNickNameEmpty
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 24, top: 8, right: 24),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, bottom: 6, left: 36),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xffEBEEF2)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.error,
                                  color: Color(0xff394452),
                                ),
                              ),
                              Text(
                                'Please fill the Nick Name',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff394452)),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.only(left: 48, top: 35),
                  child: Row(
                    children: [
                      Text(
                        'Phone Number',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2C3A4B)),
                      ),
                      Text(
                        '*',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffDA1414)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    label: '',
                    onchange: (value) {
                      isPhoneNumberEmpty = false;
                      setState(() {});
                    },
                    controller: phonenumber,
                    keyboardType: TextInputType.phone,
                    hintext: 'Phone Number',
                    onChange: (s) {},
                  ),
                ),
                isPhoneNumberEmpty
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 24, top: 8, right: 24),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, bottom: 6, left: 36),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xffEBEEF2)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.error,
                                  color: Color(0xff394452),
                                ),
                              ),
                              Text(
                                'Please fill the Phone Number',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff394452)),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.only(left: 48, top: 35),
                  child: Row(
                    children: [
                      Text(
                        'Gender',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2C3A4B)),
                      ),
                      Text(
                        '*',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffDA1414)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    label: '',
                    onchange: (value) {
                      isGenderEmpty = false;
                      setState(() {});
                    },
                    controller: genderController,
                    keyboardType: TextInputType.emailAddress,
                    hintext: 'Gender',
                    onChange: (s) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, top: 35),
                  child: Row(
                    children: [
                      Text(
                        'Date of Birth',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2C3A4B)),
                      ),
                      Text(
                        '*',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffDA1414)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: TextFormField(
                    readOnly: true,
                    onChanged: (value) {
                      // ignore: unused_local_variable
                      bool isDateOfBirthEmpty = false;
                      setState(() {});
                    },
                    controller: dateOfBirth,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (() {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime.now())
                              .then((value) {
                            dateOfBirth.text = DateFormat('MMMM dd, yyyy')
                                .format(value ?? DateTime.now());
                            setState(() {});
                          });
                        }),
                        icon: SvgPicture.asset(
                          'assets/svg/calendar.svg',
                          height: 24,
                          width: 24,
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 24, right: 24, top: 12, bottom: 12),
                      hintText: 'Date of Birth',
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffDADEE3)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 206, 206)),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 206, 206)),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, top: 35),
                  child: Row(
                    children: [
                      Text(
                        'Password',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2C3A4B)),
                      ),
                      Text(
                        '*',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffDA1414)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
                  child: CustomTextFrom(
                    label: '',
                    onchange: (value) {
                      isPasswEmty = false;
                      setState(() {});
                    },
                    suffixicon: IconButton(
                        onPressed: (() {
                          setState(() {
                            visibilityOfpasswor = !visibilityOfpasswor;
                          });
                        }),
                        icon: Icon(visibilityOfpasswor
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    controller: passwor,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.emailAddress,
                    hintext: 'Password',
                    onChange: (s) {},
                  ),
                ),
                isAddressEmpty
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 24, top: 8, right: 24),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 6, bottom: 6, left: 36),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xffEBEEF2)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.error,
                                  color: Color(0xff394452),
                                ),
                              ),
                              Text(
                                'Please fill the Password',
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff394452)),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: GestureDetector(
                    onTap: () async {
                      if (fullname.text.isEmpty) {
                        isFullNameEmpty = true;
                        setState(() {});
                      } else if (nickname.text.isEmpty) {
                        isNickNameEmpty = true;
                        setState(() {});
                      } else if (phonenumber.text.isEmpty) {
                        isPhoneNumberEmpty = true;
                        setState(() {});
                      } else if (address.text.isEmpty) {
                        isAddressEmpty = true;
                        setState(() {});
                      }
                      if (fullname.text.isNotEmpty &&
                          nickname.text.isNotEmpty &&
                          phonenumber.text.isNotEmpty &&
                          passwor.text.isNotEmpty) {
                        context.read<AuthController>().setStateUser(
                            name: fullname.text,
                            username: nickname.text,
                            password: passwor.text,
                            email: email.text,
                            gender: genderController.text,
                            birth: dateOfBirth.text,
                            onSuccess: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const UploadPhotoPage()),
                                  (route) => false);
                            });
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 10),
                      decoration: BoxDecoration(
                        color: fullname.text.isEmpty ||
                                nickname.text.isEmpty ||
                                phonenumber.text.isEmpty ||
                                passwor.text.isEmpty
                            ? const Color.fromARGB(244, 235, 134, 164)
                            : const Color(0xffFF1843),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
