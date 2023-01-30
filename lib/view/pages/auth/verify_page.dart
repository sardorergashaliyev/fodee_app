import 'package:flutter/material.dart';
import 'package:foode/controllers/auth_controller.dart';
import 'package:foode/view/pages/auth/fill_bio_page.dart';
import 'package:foode/view/widgets/on_unfocused.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
      ),
      body: OnUnFocusTap(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: PinFieldAutoFill(
                  controller: controller,
                  cursor: Cursor(color: Colors.black, enabled: true, width: 2),
                  decoration: const BoxLooseDecoration(
                    gapSpace: 10,
                    bgColorBuilder: FixedColorBuilder(
                      Colors.white,
                    ),
                    strokeColorBuilder: FixedColorBuilder(
                      Colors.black,
                    ),
                  ),
                  onCodeSubmitted: (s) {},
                  onCodeChanged: (s) {},
                  currentCode: "",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthController>().checkCode(controller.text, () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const FillBioPage()),
                        (route) => false);
                  });
                },
                child: context.watch<AuthController>().isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text("Check"))
          ],
        ),
      ),
    );
  }
}