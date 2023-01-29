import 'package:flutter/material.dart';
import 'package:foode/view/pages/auth/login_page.dart';
import 'package:foode/view/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then(
      (value) async {
        SharedPreferences _local = await SharedPreferences.getInstance();
        String name = _local.getString('name') ?? '';
        if (name.isNotEmpty) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (a) => const HomePage(),
              ), (s) {
            return false;
          });
        } else {
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (a) => const LoginPage(),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 334,
          height: 346,
          child: Image.asset('assets/image/fulllogo.png'),
        ),
      ),
    );
  }
}