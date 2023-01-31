import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List listOfCategory = [];
  bool isLoading = true;

  getCategory() async {
    isLoading = true;
    notifyListeners();
    var res = await firestore.collection("category").get();
    listOfCategory.clear();
    // ignore: avoid_function_literals_in_foreach_calls
    res.docs.forEach((element) {
      listOfCategory.add(element["name"]);
    });
    isLoading = false;
    notifyListeners();
  }
}