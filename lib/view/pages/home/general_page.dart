import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/auth_controller.dart';
import 'package:foode/view/pages/home/home_page.dart';
import 'package:provider/provider.dart';


class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  List<Widget> mainPages = [
    const HomePage(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<AuthController>().currentIndex,
        children: mainPages,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          child: BottomNavyBar(
            selectedIndex: currentIndex,
            showElevation: true,
            backgroundColor: Colors.white,
            containerHeight: 91,
            itemCornerRadius: 24,
            curve: Curves.bounceIn,
            items: [
              BottomNavyBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                  activeColor: const Color(0xffFF1843)),
              BottomNavyBarItem(
                  icon: const Icon(Icons.shopping_basket),
                  title: const Text('Order'),
                  activeColor: const Color(0xffFF1843)),
              BottomNavyBarItem(
                  icon: const Icon(Icons.message),
                  title: const Text('Chat'),
                  activeColor: const Color(0xffFF1843)),
              BottomNavyBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Profile'),
                activeColor: const Color(0xffFF1843),
              )
            ],
            onItemSelected: (value) {
              context.read<AuthController>().setIndex(value);
            },
          ),
        ),
      ),
    );
  }
}