import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class PopularMenu extends StatefulWidget {
  const PopularMenu({super.key});

  @override
  State<PopularMenu> createState() => _PopularMenuState();
}

class _PopularMenuState extends State<PopularMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(244, 63, 94, 0.1),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Color.fromRGBO(244, 63, 94, 0.7),
                    ),
                  ),
                ),
                24.horizontalSpace,
                const Text(
                  'Popular Menu',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Row(
              children: [
                24.horizontalSpace,
                SizedBox(
                  width: 310.w,
                  height: 45.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF4F6F9),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      hintText: 'Search',
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(color: Color(0xffF4F6F9)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(color: Color(0xffF4F6F9)),
                      ),
                    ),
                  ),
                ),
                20.horizontalSpace,
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(244, 63, 94, 0.1),
                  ),
                  child: const Icon(Icons.menu, color: Colors.pink),
                )
              ],
            ),
            0.verticalSpace,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      context.watch<HomeController>().listOfProduct.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(16),
                      width: double.infinity,
                      height: 90,
                      color: Colors.pinkAccent,
                      child: Row(
                        children: [
                          context
                                      .watch<HomeController>()
                                      .listOfProduct[index]
                                      .image ==
                                  null
                              ? const SizedBox.shrink()
                              : Image.network(
                                  context
                                          .watch<HomeController>()
                                          .listOfProduct[index]
                                          .image ??
                                      "",
                                  height: 64,
                                  width: 64,
                                ),
                          Column(
                            children: [
                              Text(context
                                      .watch<HomeController>()
                                      .listOfProduct[index]
                                      .name ??
                                  ""),
                              Text(context
                                      .watch<HomeController>()
                                      .listOfProduct[index]
                                      .desc ??
                                  ""),
                            ],
                          ),
                          const Spacer(),
                          Text(context
                              .watch<HomeController>()
                              .listOfProduct[index]
                              .price
                              .toString())
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
