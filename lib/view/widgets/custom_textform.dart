import 'package:flutter/material.dart';

class CustomTextFrom extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final String? obscuringCharacter;
  final Widget? suffixicon;
  final TextInputType keyboardType;
  final ValueChanged<String>? onchange;
  final bool? obscureText;
  


  const CustomTextFrom({
    Key? key,
    required this.controller,
    required this.hintext,
    this.keyboardType = TextInputType.text,
    this.onchange,
    this.suffixicon,
    this.obscureText,
    this.obscuringCharacter,  
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
      decoration: InputDecoration(
        hintText: hintext,
        suffixIcon: suffixicon,
        contentPadding:
            const EdgeInsets.only(left: 24, right: 80, top: 12, bottom: 12),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.blue, width: 0.0),
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
      ),
    );
  }
}
