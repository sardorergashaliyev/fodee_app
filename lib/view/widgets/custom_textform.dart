import 'package:flutter/material.dart';
import 'package:foode/controllers/app_controller.dart';
import 'package:provider/provider.dart';

class CustomTextFrom extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool isObscure;
  final double radius;
  final FocusNode? node;
  final Color? colorBorder;
  final Color? colorFill;

  final ValueChanged<String>? onChange;

  const CustomTextFrom({
    Key? key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.onChange,
    this.suffixIcon,
    this.node,
    required String hintext,
    onchange,
    IconButton? suffixicon,
    String? obscuringCharacter,
    this.radius = 0,
    this.colorBorder = const Color(0x0ff00000),
    this.colorFill = const Color(0xffFFFFFF),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: node,
      obscureText:
          isObscure ? (context.watch<AppController>().isVisibility) : false,
      onChanged: onChange,
      decoration: InputDecoration(
          filled: true,
          fillColor: colorFill,
          labelText: label,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: colorBorder ?? const Color(0x00000000)),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: colorBorder ?? const Color(0x00000000)),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: colorBorder ?? const Color(0x00000000)),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          suffixIcon: suffixIcon ??
              (isObscure
                  ? IconButton(
                      onPressed: () {
                        context.read<AppController>().onChange();
                      },
                      icon: context.watch<AppController>().isVisibility
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    )
                  : const SizedBox.shrink())),
    );
  }
}
