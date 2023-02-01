import 'package:flutter/material.dart';
import 'package:foode/controllers/app_controller.dart';
import 'package:provider/provider.dart';

class CustomTextFrom extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final String? obscuringCharacter;
  final Widget? suffixicon;
  final TextInputType keyboardType;
  final ValueChanged<String>? onchange;
  final bool isObscure;
  final String? label;
  final Icon? icon;

  const CustomTextFrom({
    Key? key,
    required this.controller,
    required this.hintext,
    this.keyboardType = TextInputType.text,
    this.onchange,
    this.suffixicon,
    this.isObscure = false,
    this.obscuringCharacter,
    this.label,
    this.icon, required Null Function(dynamic s) onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return '';
      },
      onChanged: onchange,
      controller: controller,
      keyboardType: keyboardType,
      obscureText:
          isObscure ? (context.watch<AppController>().isVisibility) : false,
      decoration: InputDecoration(
          prefixIcon: icon,
          label: Text('$label'),
          hintText: hintext,
          contentPadding:
              const EdgeInsets.only(left: 24, right: 80, top: 12, bottom: 12),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 0.0),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          suffixIcon: isObscure
              ? IconButton(
                  onPressed: () {
                    context.read<AppController>().onChange();
                  },
                  icon: context.watch<AppController>().isVisibility
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : const SizedBox.shrink()),
    );
  }
}
