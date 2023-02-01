import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/home_controller.dart';
import 'package:foode/view/widgets/all_product_page.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/cached_network_image.dart';
import 'package:foode/view/widgets/see_all_categ.dart';
import 'package:provider/provider.dart';

import '../../../controllers/user_controller.dart';
import '../../widgets/akciya_builder.dart';
import '../../widgets/popular_menu_builder.dart';
import '../../widgets/restaurant_builder.dart';
import '../auth/sign_in_page.dart';

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

      context.read<HomeController>()
        ..getBanners()
        ..getProduct()
        ..getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/image/Group.png'))),
        child: Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/Group.png')),
              ),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    children: [
                      24.horizontalSpace,
                      CustomImageNetwork(
                          radius: 100,
                          height: 80.h,
                          width: 80.w,
                          image: context.watch<UserController>().user?.avatar ??
                              ""),
                      24.horizontalSpace,
                      Expanded(
                        child: Column(
                          children: [
                            Text('Hello👋',
                                style: Style.textStyleRegular(size: 19)),
                            Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                                context
                                        .watch<UserController>()
                                        .user
                                        ?.username ??
                                    '',
                                style: Style.textStyleRegular(size: 19)),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffF6F8FB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: const Icon(
                            Icons.notifications_active,
                            color: Style.primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: GestureDetector(
                          onTap: () {
                            context.read<UserController>().logOut(() {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignInPage()),
                                  (route) => false);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color(0xffF6F8FB),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: const Icon(
                              Icons.logout_outlined,
                              color: Style.primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  32.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: SizedBox(
                            height: 45.h,
                            width: 300.w,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Style.greyColor,
                                contentPadding: const EdgeInsets.only(
                                  left: 28,
                                ),
                                suffixIcon: const Icon(Icons.search_rounded),
                                hintText: 'Search',
                                hintStyle: Style.textStyleRegular2(size: 14),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Style.greyColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Style.greyColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              color: const Color(0xffF43F5E).withOpacity(0.1)),
                          child: const Icon(
                            Icons.filter_list,
                            color: Color(0xffF43F5E),
                          ),
                        )
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          12.verticalSpace,
                          const SizedBox(height: 185, child: AkciyaListView()),
                          32.verticalSpace,
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Text('Popular Restaurant',
                                    style: Style.textStyleRegular(
                                        size: 20, textColor: Style.blackColor)),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            const CategoryPage()),
                                      ),
                                    );
                                  },
                                  child: Text('See all',
                                      style: Style.textStyleRegular(
                                          size: 16,
                                          textColor: Style.primaryColor)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 190.h,
                            child: const RestaurantListview(),
                          ),
                          32.verticalSpace,
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Text('Popular Menu',
                                    style: Style.textStyleRegular(size: 20)),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (a) =>
                                              const ProductListPage()),
                                    );
                                  },
                                  child: Text(
                                    'See all',
                                    style: Style.textStyleRegular2(
                                        textColor: Style.primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const MenuListView(),
                          120.verticalSpace,
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
