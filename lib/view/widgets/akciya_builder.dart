import 'package:flutter/material.dart';
import 'package:foode/controllers/home_controller.dart';
import 'package:foode/view/widgets/cached_network_image.dart';
import 'package:provider/provider.dart';

class AkciyaListView extends StatelessWidget {
  const AkciyaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: context.watch<HomeController>().listOfBanners.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width - 48,
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
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
                        height: 150,
                        width: 150,
                      )
                    : const SizedBox.shrink(),
                Column(
                  children: [
                    Text(context
                        .watch<HomeController>()
                        .listOfBanners[index]
                        .title),
                    Text(context
                            .watch<HomeController>()
                            .listOfBanners[index]
                            .product
                            .name ??
                        ""),
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
