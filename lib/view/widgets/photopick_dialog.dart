import 'package:flutter/material.dart';
import 'package:foode/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class ProductImageDialog extends StatelessWidget {
  const ProductImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Please choose'),
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<ProductController>().getImageCamera();
                      },
                      icon: const Icon(
                        Icons.photo_camera,
                        size: 24,
                      )),
                  IconButton(
                      onPressed: () {
                        context.read<ProductController>().getImageGallery();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.photo, size: 24)),
                ],
              );
            });
      },
      child: Center(
        child: Image.asset(
          'assets/image/image_add.gif',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
