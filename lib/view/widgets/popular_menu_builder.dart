import 'package:flutter/material.dart';
import 'package:foode/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class MenuListView extends StatelessWidget {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<HomeController>().listOfProduct.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(16),
          width: double.infinity,
          height: 90,
          color: Colors.pinkAccent,
          child: Row(
            children: [
              context.watch<HomeController>().listOfProduct[index].image == null
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
              Spacer(),
              Text(context
                  .watch<HomeController>()
                  .listOfProduct[index]
                  .price
                  .toString(),)
            ],
          ),
        );
      },
    );
  }
}
