import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/product_controller.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:foode/view/widgets/photo_edit.dart';
import 'package:foode/view/widgets/photopick_dialog.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController nameTextEditController = TextEditingController();
  final TextEditingController descTextEditController = TextEditingController();
  final TextEditingController priceTextEditController = TextEditingController();
  final TextEditingController typeEditController = TextEditingController();

  bool isNameEmpty = false;
  bool isDescEmpty = false;
  bool isPriceEmpty = false;
  bool isTypeEmpty = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductController>().getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/image/Group.png')),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.watch<ProductController>().imagePath.isEmpty
                  ? const ProductImageDialog()
                  : const SizedBox.shrink(),
              context.watch<ProductController>().imagePath.isEmpty
                  ? const SizedBox.shrink()
                  : Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(
                                  File(context
                                      .watch<ProductController>()
                                      .imagePath),
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const EditPhotoProduct()
                      ],
                    ),
              30.verticalSpace,
              CustomTextFrom(
                onchange: (value) {
                  isPriceEmpty = false;
                  setState(() {});
                },
                colorFill: Style.greyColor,
                colorBorder: Style.greyColor,
                radius: 50,
                controller: nameTextEditController,
                label: "Name",
                hintext: '',
                obscuringCharacter: '',
                suffixicon: null,
              ),
              !isNameEmpty
                  ? const SizedBox.shrink()
                  : const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'This field is required!',
                        style: TextStyle(color: Style.primaryColor),
                      ),
                    ),
              50.verticalSpace,
              CustomTextFrom(
                onchange: (value) {
                  isPriceEmpty = false;
                  setState(() {});
                },
                colorFill: Style.greyColor,
                colorBorder: Style.greyColor,
                radius: 50,
                controller: descTextEditController,
                label: "Description",
                hintext: '',
                obscuringCharacter: '',
                suffixicon: null,
              ),
              !isDescEmpty
                  ? const SizedBox.shrink()
                  : const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'This field is required!',
                        style: TextStyle(color: Style.primaryColor),
                      ),
                    ),
              50.verticalSpace,
              CustomTextFrom(
                onchange: (value) {
                  isPriceEmpty = false;
                  setState(() {});
                },
                colorFill: Style.greyColor,
                colorBorder: Style.greyColor,
                radius: 50,
                controller: priceTextEditController,
                label: "Price",
                hintext: '',
                obscuringCharacter: '',
                suffixicon: null,
              ),
              !isPriceEmpty
                  ? const SizedBox.shrink()
                  : const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'This field is required!',
                        style: TextStyle(color: Style.primaryColor),
                      ),
                    ),
              50.verticalSpace,
              DropdownButtonFormField(
                dropdownColor: const Color.fromARGB(255, 230, 226, 226),
                borderRadius: const BorderRadius.all(Radius.circular(28)),
                autofocus: true,
                value: context.watch<ProductController>().listOfCategory.first,
                items: context
                    .watch<ProductController>()
                    .listOfCategory
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (s) {},
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Style.greyColor,
                  labelText: "",
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 221, 206, 206)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
              ),
              50.verticalSpace,
              CustomTextFrom(
                onchange: (value) {
                  isPriceEmpty = false;
                  setState(() {});
                },
                colorFill: Style.greyColor,
                colorBorder: Style.greyColor,
                radius: 100,
                controller: typeEditController,
                label: "Type",
                hintext: '',
                obscuringCharacter: '',
                suffixicon: null,
              ),
              !isTypeEmpty
                  ? const SizedBox.shrink()
                  : const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'This field is required!',
                        style: TextStyle(color: Style.primaryColor),
                      ),
                    ),
              30.verticalSpace,
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      context.read<ProductController>().createProduct(
                          name: nameTextEditController.text,
                          desc: descTextEditController.text,
                          price: priceTextEditController.text);
                      nameTextEditController.clear();
                      descTextEditController.clear();
                      priceTextEditController.clear();
                      context.read<ProductController>().imagePath = '';
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          autoCloseDuration: const Duration(seconds: 3));
                    },
                    child: context.watch<ProductController>().isSaveLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Save")),
              ),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    ));
  }
}
