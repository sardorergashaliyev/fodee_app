import 'package:flutter/material.dart';
import 'package:foode/controllers/home_controller.dart';
import 'package:foode/view/widgets/cached_network_image.dart';
import 'package:provider/provider.dart';

class RestaurantListview extends StatelessWidget {
  const RestaurantListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 14),
      child: SizedBox(
        height: 180,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: context.watch<HomeController>().listOfCategory.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: (MediaQuery.of(context).size.width - 48) / 3,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    context
                                .watch<HomeController>()
                                .listOfCategory[index]
                                .image !=
                            null
                        ? CustomImageNetwork(
                            image: context
                                    .watch<HomeController>()
                                    .listOfCategory[index]
                                    .image ??
                                '',
                            height: 100,
                            width: 100,
                          )
                        : const SizedBox.shrink(),
                    Column(
                      children: [
                        Text(context
                                .watch<HomeController>()
                                .listOfCategory[index]
                                .name ??
                            ""),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
