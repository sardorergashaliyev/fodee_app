import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/view/pages/home/general_page.dart';
import 'package:google_fonts/google_fonts.dart';


class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/Group.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/done.png',
                      height: 173.h,
                      width: 177.75.w,
                    ),
                    24.verticalSpace,
                    Text(
                      'Congrats!',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffF43F5E)),
                    ),
                    24.verticalSpace,
                    Text(
                      'Your profile is ready to use!',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff09101D)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => const GeneralPage())));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 134),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [Color(0xffFF1843), Color(0xffFF7E95)]),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Center(
                    child: Text(
                      'Go homepage',
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
    );
  }
}