import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularRes extends StatefulWidget {
  const PopularRes({super.key});


  @override
  State<PopularRes> createState() => _PopularResState();
}

class _PopularResState extends State<PopularRes> {
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
                  'Popular Restaurant',
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
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 230,
                      childAspectRatio: 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 32),
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 241, 241),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container()
                    );
                  },
                ),
              ),
            ),
            32.verticalSpace,
            32.verticalSpace,
          ],
        ),
      ),
      );
  }
}