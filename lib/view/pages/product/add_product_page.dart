import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/product_controller.dart';
import 'package:foode/view/widgets/custom_textform.dart';
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
  final TextEditingController categoryTextEditController =
      TextEditingController();
  final TextEditingController typeEditController = TextEditingController();

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
                controller: nameTextEditController,
                label: "name",
                hintext: '',
              ),
              50.verticalSpace,
              CustomTextFrom(
                controller: descTextEditController,
                label: "desc",
                hintext: '',
              ),
              50.verticalSpace,
              CustomTextFrom(
                controller: priceTextEditController,
                label: "price",
                keyboardType: TextInputType.number,
                hintext: '',
              ),
              50.verticalSpace,
              DropdownButtonFormField(
                dropdownColor: Color.fromARGB(255, 230, 226, 226),
                borderRadius: BorderRadius.all(Radius.circular(28)),
                autofocus: true,
                value: context.watch<ProductController>().listOfCategory.first,
                items: context
                    .watch<ProductController>()
                    .listOfCategory
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (s) {},
                decoration: InputDecoration(
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
                controller: categoryTextEditController,
                label: "category",
                hintext: '',
              ),
              50.verticalSpace,
              CustomTextFrom(
                controller: typeEditController,
                label: "type",
                hintext: '',
              ),
              30.verticalSpace,
              ElevatedButton(onPressed: () {}, child: Text("Save"))
            ],
          ),
        ),
      ),
    ));
  }
}
