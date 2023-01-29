import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:foode/view/widgets/popolar_res.dart';
import 'package:foode/view/widgets/popular_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image/background_image.png'),
          ),
        ),
        child: Column(
          children: [
            72.verticalSpace,
            Row(
              children: [
                24.horizontalSpace,
                SizedBox(
                  height: 42.h,
                  width: 42.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                24.horizontalSpace,
                Text(
                  "Hello, $name!",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.notifications_active, color: Colors.pink),
                24.horizontalSpace
              ],
            ),
            36.verticalSpace,
          ],
        ),
      ),
    );
  }
}
