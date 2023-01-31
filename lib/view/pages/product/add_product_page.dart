import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/auth_controller.dart';
import 'package:foode/controllers/product_controller.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  bool isNameEmpty = true;
  bool isDescEmpty = true;
  bool isPriceEmpty = true;
  bool isTypeEmpty = true;

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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              50.verticalSpace,
              CustomTextFrom(
                label: 'Name',
                onchange: (value) {
                  isNameEmpty = false;
                  setState(() {});
                },
                controller: nameTextEditController,
                keyboardType: TextInputType.emailAddress,
                hintext: '',
              ),
              50.verticalSpace,
              CustomTextFrom(
                label: 'Description',
                onchange: (value) {
                  isDescEmpty = false;
                  setState(() {});
                },
                controller: descTextEditController,
                keyboardType: TextInputType.emailAddress,
                hintext: '',
              ),
              50.verticalSpace,
              CustomTextFrom(
                onchange: (value) {},
                controller: priceTextEditController,
                label: "Price",
                keyboardType: TextInputType.number,
                hintext: '',
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
                  labelText: "Category",
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
                label: 'Type',
                onchange: (value) {
                  isTypeEmpty = false;
                  setState(() {});
                },
                controller: typeEditController,
                keyboardType: TextInputType.emailAddress,
                hintext: '',
              ),
              30.verticalSpace,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: InkWell(
                  onTap: () async {
                    if (nameTextEditController.text.isEmpty) {
                      isNameEmpty = true;
                      setState(() {});
                    } else if (descTextEditController.text.isEmpty) {
                      isDescEmpty = true;
                      setState(() {});
                    } else if (priceTextEditController.text.isEmpty) {
                      isPriceEmpty = true;
                      setState(() {});
                    }
                    if (nameTextEditController.text.isNotEmpty &&
                        descTextEditController.text.isNotEmpty &&
                        priceTextEditController.text.isNotEmpty &&
                        typeEditController.text.isEmpty) {
                      context.read<ProductController>().createProduct(
                          name: nameTextEditController.text,
                          desc: descTextEditController.text,
                          price: priceTextEditController.text);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 10),
                    decoration: BoxDecoration(
                      color: nameTextEditController.text.isEmpty ||
                              descTextEditController.text.isEmpty ||
                              priceTextEditController.text.isEmpty ||
                              typeEditController.text.isEmpty
                          ? const Color.fromARGB(244, 235, 134, 164)
                          : const Color(0xffFF1843),
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    ));
  }
}
