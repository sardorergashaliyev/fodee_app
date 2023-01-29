import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:foode/controllers/local/local.dart';
import 'package:foode/model/user_model.dart';

class UserController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserModel? user;
  bool isLoading = false;

  getUser() async {
    isLoading = true;
    notifyListeners();
    String? docId = await LocalStore.getDocId();
    var res = await firestore.collection("users").doc(docId).get();
    user = UserModel.fromJson(res.data());
    isLoading = false;
    notifyListeners();
  }

  logOut(VoidCallback onSuccess) async {
    await LocalStore.storeClear();
    onSuccess();
  }
}