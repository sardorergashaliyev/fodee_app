import 'package:flutter/material.dart';
import 'package:foode/controllers/user_controller.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().getUser();
    });
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Image.network(
                    context.watch<UserController>().user?.avatar ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              24.horizontalSpace,
              Text(
                "Hello, ${context.watch<UserController>().user?.name ?? ""}!",
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
          Row(
            children: [
              24.horizontalSpace,
              SizedBox(
                width: 300.w,
                child: CustomTextFrom(
                  controller: searchController,
                  hintext: 'Search',
                  suffixicon: const Icon(Icons.search),
                ),
              ),
              24.horizontalSpace,
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Style.primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
