import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class FacebookandGoogle extends StatelessWidget {
  const FacebookandGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Row(
            children: [
              37.5.horizontalSpace,
              Image.asset(
                'assets/image/facebook.png',
                height: 25,
                width: 25,
              ),
              12.horizontalSpace,
              Text(
                'Facebook',
                style: Style.textStyleRegular2(textColor: Style.blackColor),
              ),
            ],
          ),
          height: 57.h,
          width: 178.w,
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 221, 206, 206)),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
        ),
        Container(
          height: 57.h,
          width: 178.w,
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 221, 206, 206)),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Row(
            children: [
              37.5.horizontalSpace,
              Image.asset(
                'assets/image/google.png',
                height: 25,
                width: 24,
              ),
              12.horizontalSpace,
              Text(
                'Google',
                style: Style.textStyleRegular2(textColor: Style.blackColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
