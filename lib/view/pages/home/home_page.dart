import 'package:flutter/material.dart';
import 'package:foode/controllers/user_controller.dart';
import 'package:foode/view/pages/auth/sign_in_page.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserController>().getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: context.watch<UserController>().isLoading
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(context.watch<UserController>().user?.name ?? ""),
                  Text(context.watch<UserController>().user?.username ?? ""),
                  Text(context.watch<UserController>().user?.gender ?? ""),
                  Image.network(
                      context.watch<UserController>().user?.avatar ?? ""),
                  ElevatedButton(
                      onPressed: () {
                        context.read<UserController>().logOut(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignInPage()),
                              (route) => false);
                        });
                      },
                      child: const Text("Log out"))
                ],
              ),
            ),
    );
  }
}