import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/home_controller.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/cached_network_image.dart';
import 'package:provider/provider.dart';

class MenuListView extends StatelessWidget {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<HomeController>().listOfProduct.length >= 4
          ? 4
          : context.watch<HomeController>().listOfProduct.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width - 48,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Style.greyColor,
          ),
          child: Row(
            children: [
              context.watch<HomeController>().listOfProduct[index].image == null
                  ? const SizedBox.shrink()
                  : CustomImageNetwork(
                      image: context
                              .watch<HomeController>()
                              .listOfProduct[index]
                              .image ??
                          '',
                      height: 100,
                      width: 80,
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.horizontalSpace,
                  Text(context
                          .watch<HomeController>()
                          .listOfProduct[index]
                          .name ??
                      ""),
                  SizedBox(
                    width: 150,
                    child: Text(
                      context
                              .watch<HomeController>()
                              .listOfProduct[index]
                              .desc ??
                          "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  context
                      .watch<HomeController>()
                      .listOfProduct[index]
                      .price
                      .toString(),
                  style: const TextStyle(
                      color: Style.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
