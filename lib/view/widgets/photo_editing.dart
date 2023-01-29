import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/auth_controller.dart';
import 'package:provider/provider.dart';

class PhotoEditing extends StatefulWidget {
  const PhotoEditing({super.key});

  @override
  State<PhotoEditing> createState() => _PhotoEditingState();
}

class _PhotoEditingState extends State<PhotoEditing> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {
            showCupertinoDialog(
                context: context,
                builder: ((context) => CupertinoAlertDialog(
                      title: const Text('Choose'),
                      actions: [
                        CupertinoButton(
                            onPressed: (() async {
                              context.read<AuthController>().getImageCamera();
                            }),
                            child: const Text("Take photo")),
                        CupertinoButton(
                            onPressed: (() async {
                              context.read<AuthController>().getImageGallery();
                            }),
                            child: const Text("From Gallery")),
                        CupertinoButton(
                            onPressed: (() async {
                              context.read<AuthController>().deleteImage();
                              Navigator.pop(context);
                              setState(() {});
                            }),
                            child: const Text('Delete')),
                        CupertinoButton(
                            onPressed: (() async {
                              Navigator.pop(context);
                            }),
                            child: const Text('Cancel'))
                      ],
                    )));
          },
          child: Container(
            height: 55.h,
            width: 55.w,
            decoration: const BoxDecoration(
              color: Color(0xffF43F5E),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.r),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ));
  }
}
