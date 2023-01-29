import 'package:flutter/material.dart';
import 'package:foode/view/style/style.dart';

class Warning extends StatelessWidget {
  final String text;
  const Warning({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 36),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xffEBEEF2)),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: Icon(
              Icons.error,
              color: Color(0xff394452),
            ),
          ),
          Text(text,
              style: Style.textStyleRegular2(
                  size: 14, textColor: const Color(0xff394452))),
        ],
      ),
    );
  }
}
