import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../style/style.dart';

class AuthButton extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? passw;
  const AuthButton({super.key, required this.controller, this.passw});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
      decoration: BoxDecoration(
        color: controller.text.isEmpty
            ? const Color.fromARGB(244, 235, 134, 164)
            : const Color(0xffFF1843),
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: Center(
        child: context.watch<AuthController>().isLoading
            ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: LoadingAnimationWidget.inkDrop(
                    color: Style.whiteColor, size: 35),
              )
            : Text('Sign in',
                style: Style.textStyleRegular(textColor: Style.whiteColor)),
      ),
    );
  }
}
