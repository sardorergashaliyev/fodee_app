import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/home_controller.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/cached_network_image.dart';
import 'package:provider/provider.dart';

class AkciyaListView extends StatelessWidget {
  const AkciyaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: context.watch<HomeController>().listOfBanners.length,
        itemBuilder: (context, index) {
          return Container(
            height: 150.h,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width - 48,
            decoration: BoxDecoration(
                gradient: Style.linearGradient,
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              children: [
                context
                            .watch<HomeController>()
                            .listOfBanners[index]
                            .product
                            .image !=
                        null
                    ? CustomImageNetwork(
                        image: context
                                .watch<HomeController>()
                                .listOfBanners[index]
                                .product
                                .image ??
                            '',
                        height: 150.h,
                        width: 150.w,
                      )
                    : const SizedBox.shrink(),
                Column(
                  children: [
                    12.verticalSpace,
                    SizedBox(
                      width: 150,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            context
                                .watch<HomeController>()
                                .listOfBanners[index]
                                .title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Style.whiteColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          context
                                  .watch<HomeController>()
                                  .listOfBanners[index]
                                  .product
                                  .name ??
                              "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Style.whiteColor, fontSize: 16),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 120.w,
                      height: 37.h,
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      child: Center(
                        child: Text('Buy Now',
                            style: Style.textStyleRegular(
                                size: 14, textColor: Style.whiteColor)),
                      ),
                    ),
                    24.verticalSpace
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
