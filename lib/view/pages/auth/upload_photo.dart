import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foode/controllers/auth_controller.dart';
import 'package:foode/view/pages/home/general_page.dart';
import 'package:provider/provider.dart';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({Key? key}) : super(key: key);

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            context.watch<AuthController>().imagePath.isEmpty
                ? Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<AuthController>().getImageCamera();
                          },
                          child: const Text("Take photo")),
                      ElevatedButton(
                          onPressed: () {
                            context.read<AuthController>().getImageGallery();
                          },
                          child: const Text("Take file")),
                    ],
                  )
                : const SizedBox.shrink(),

            context.watch<AuthController>().imagePath.isEmpty
                ? const SizedBox.shrink()
                : Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(
                                File(context.watch<AuthController>().imagePath),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                     ],
                  ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                context.read<AuthController>().createUser(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const GeneralPage()),
                      (route) => false);
                });
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    ));
  }
}