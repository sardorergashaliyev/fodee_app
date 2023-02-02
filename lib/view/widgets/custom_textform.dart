import 'package:flutter/material.dart';
import 'package:foode/controllers/app_controller.dart';
import 'package:provider/provider.dart';

class CustomTextFrom extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool isObscure;
  final FocusNode? node;
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
    IconButton? suffixicon, String? obscuringCharacter,
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
          labelText: label,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
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
