import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/auth_controller.dart';
import 'package:foode/view/pages/auth/sign_up_page.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/auth_button.dart';
import 'package:foode/view/widgets/ckeck_box.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:foode/view/widgets/facebook_google.dart';
import 'package:foode/view/widgets/warning_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../home/general_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool value = false;
  bool isPhoneEmpty = false;
  bool isPasswordEmpty = false;
  bool visibilityOfpasswor = true;

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.verticalSpace,
            Image.asset(
              'assets/image/LogoMainPage.png',
              height: 192.h,
              width: 199.2.w,
            ),
            Text('Sign in to your account',
                style: Style.textStyleRegular(size: 23)),
            32.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(
                left: 48,
              ),
              child: Row(
                children: [
                  Text('Phone',
                      style: Style.textStyleRegular2(
                          textColor: const Color(0xff2C3A4B))),
                  Text('*',
                      style: Style.textStyleRegular2(
                          size: 14, textColor: Style.primaryColor)),
                ],
              ),
            ),
            8.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomTextFrom(
                onchange: (value) {
                  isPhoneEmpty = false;
                  setState(() {});
                },
                controller: phone,
                keyboardType: TextInputType.phone,
                hintext: 'Phone Number',
              ),
            ),
            8.verticalSpace,
            isPhoneEmpty
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Warning(
                      text: 'Please fill the Phone',
                    ))
                : const SizedBox.shrink(),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Row(
                children: [
                  Text('Password',
                      style: Style.textStyleRegular2(
                          textColor: const Color(0xff2C3A4B))),
                  Text('*',
                      style: Style.textStyleRegular2(
                          size: 14, textColor: Style.primaryColor)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
              child: CustomTextFrom(
                onchange: (value) {
                  isPasswordEmpty = false;
                  setState(() {});
                },
                suffixicon: IconButton(
                    onPressed: () {
                      visibilityOfpasswor = !visibilityOfpasswor;
                      setState(() {});
                    },
                    icon: Icon(visibilityOfpasswor
                        ? Icons.visibility
                        : Icons.visibility_off)),
                controller: password,
                obscureText: !visibilityOfpasswor,
                obscuringCharacter: '*',
                keyboardType: TextInputType.multiline,
                hintext: 'Password',
              ),
            ),
            8.verticalSpace,
            isPasswordEmpty
                ? const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 24),
                    child: Warning(
                      text: 'Please fill the Password',
                    ))
                : const SizedBox.shrink(),
            22.verticalSpace,
            const Padding(
                padding: EdgeInsets.only(
                  left: 48,
                ),
                child: CkeckBox()),
            context.watch<AuthController>().errorText == null
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      context.watch<AuthController>().errorText ?? "",
                      style: Style.textStyleRegular2(textColor: Colors.red),
                    ),
                  ),
            24.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: InkWell(
                  onTap: () {
                    if (phone.text.isEmpty) {
                      isPhoneEmpty = true;
                    } else if (password.text.isEmpty) {
                      isPasswordEmpty = true;
                      setState(() {});
                    }
                    if (phone.text.isNotEmpty && password.text.isNotEmpty) {
                      context
                          .read<AuthController>()
                          .login(phone.text, password.text, () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const GeneralPage()),
                            (route) => false);
                      });
                    }
                  },
                  child: AuthButton(
                    controller: phone,
                    passw: password,
                  )),
            ),
            20.verticalSpace,
            Text('Forgot the password?',
                style: Style.textStyleRegular2(textColor: Style.primaryColor)),
            32.verticalSpace,
            Text('or continue with',
                style: Style.textStyleRegular2(textColor: Style.blackColor)),
            24.verticalSpace,
            const FacebookandGoogle(),
            32.verticalSpace,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Don’t have an account?',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff858C94)),
              ),
              TextButton(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const SignUpPage())));
                }),
                child: Text('Sign up',
                    style:
                        Style.textStyleRegular2(textColor: Style.primaryColor)),
              )
            ])
          ],
        ),
      ),
    );
  }
}
