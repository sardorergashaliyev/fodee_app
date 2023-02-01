import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/auth_controller.dart';
import 'package:foode/view/pages/auth/sign_in_page.dart';
import 'package:foode/view/pages/auth/verify_page.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/auth_button.dart';
import 'package:foode/view/widgets/ckeck_box.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:foode/view/widgets/facebook_google.dart';
import 'package:foode/view/widgets/fullogo_image.dart';
import 'package:foode/view/widgets/on_unfocused.dart';
import 'package:foode/view/widgets/warning_container.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phone = TextEditingController();
  bool isPhoneEmpty = false;

  @override
  void dispose() {
    phone.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnUnFocusTap(
        child: SafeArea(
          child: SingleChildScrollView(
            child: OnUnFocusTap(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FullogoImage(
                    height: 192,
                    width: 192,
                  ),
                  Text('Sign up for free',
                      style: Style.textStyleRegular(
                          size: 23, textColor: Style.blackColor)),
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
                      label: '',
                      onchange: (value) {
                        isPhoneEmpty = false;
                        setState(() {});
                      },
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      hintext: 'Phone Number', onChange: (s) {  },
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
                  22.verticalSpace,
                  const Padding(
                      padding: EdgeInsets.only(
                        left: 48,
                      ),
                      child: CkeckBox()),
                  context.watch<AuthController>().errorText == null
                      ? const SizedBox.shrink()
                      : Text(
                          context.watch<AuthController>().errorText ?? "",
                          style: Style.textStyleRegular2(
                              textColor: Style.primaryColor),
                        ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: InkWell(
                      onTap: () {
                        if (phone.text.isEmpty) {
                          isPhoneEmpty = true;
                        }
                        setState(() {});
                        if (phone.text.isNotEmpty) {
                          context.read<AuthController>().sendSms(phone.text, () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const VerifyPage()),
                            );
                          });
                        }
                      },
                      child: AuthButton(
                        controller: phone, text: 'Sign up',
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Text('Forgot the password?',
                      style:
                          Style.textStyleRegular2(textColor: Style.primaryColor)),
                  32.verticalSpace,
                  Text('or continue with',
                      style:
                          Style.textStyleRegular2(textColor: Style.blackColor)),
                  24.verticalSpace,
                  const FacebookandGoogle(),
                  24.verticalSpace,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Already have an account?',
                      style: Style.textStyleRegular2(
                          textColor: const Color(0xff858C94)),
                    ),
                    TextButton(
                      onPressed: (() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (a) => const SignInPage()),
                            (route) => false);
                      }),
                      child: Text('Sign in',
                          style: Style.textStyleRegular2(
                              textColor: Style.primaryColor)),
                    )
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
