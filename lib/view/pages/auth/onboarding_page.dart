import 'package:flutter/material.dart';
import 'package:foode/view/pages/auth/sign_in_page.dart';
import 'package:foode/view/style/style.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/food.png'),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('Foode',
                        style: Style.textStyleRegular(
                            size: 33, textColor: Style.whiteColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                        'The best food ordering and delivery app of the century',
                        style: Style.textStyleRegular2(
                            textColor: Style.whiteColor)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 48, left: 24, right: 24),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const SignInPage())));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 169.5),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            gradient: Style.linearGradient),
                        child: Center(
                          child: Text(
                            'Next',
                            style: Style.textStyleRegular(
                                textColor: Style.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}