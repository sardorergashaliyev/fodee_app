import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foode/controllers/chat_controller.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/cached_network_image.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:provider/provider.dart';

import 'message_page.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final TextEditingController searchUser = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatController>()
        ..getUserList()
        ..getChatsList();
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<ChatController>().setOffline();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final event = context.read<ChatController>();
    final state = context.watch<ChatController>();
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/image/Group.png',
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Chats',
                          style: TextStyle(
                              color: Style.blackColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 45.h,
                        child: CustomTextFrom(
                          colorFill: Style.greyColor,
                          colorBorder: Style.greyColor,
                          radius: 100,
                          controller: searchUser,
                          label: "Users",
                          hintext: '',
                          onchange: (value) {},
                          obscuringCharacter: '',
                          suffixicon: null,
                        ),
                      )),
                      IconButton(
                        color: Style.primaryColor,
                        onPressed: () {
                          event.changeAddUser();
                        },
                        icon: state.addUser
                            ? const Icon(Icons.remove)
                            : const Icon(Icons.add),
                      )
                    ],
                  ),
                  state.addUser
                      ? Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.users.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    event.createChat(index, (id) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (_) => MessagePage(
                                                    docId: id,
                                                    user: state.users[index],
                                                  )));
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: BoxDecoration(
                                        color: Style.greyColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      children: [
                                        state.users[index].avatar == null
                                            ? const SizedBox.shrink()
                                            : CustomImageNetwork(
                                                image:
                                                    state.users[index].avatar ??
                                                        "",
                                                height: 62,
                                                width: 62,
                                              ),
                                        12.horizontalSpace,
                                        Text(state.users[index].name ?? "")
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.chats.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MessagePage(
                                          docId: state.listOfDocIdChats[index],
                                          user: state.chats[index].resender,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: BoxDecoration(
                                        color: Style.greyColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      children: [
                                        state.chats[index].resender.avatar ==
                                                null
                                            ? const SizedBox.shrink()
                                            : CustomImageNetwork(
                                                image: state.chats[index]
                                                        .resender.avatar ??
                                                    "",
                                                height: 62,
                                                width: 62,
                                              ),
                                        12.horizontalSpace,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                state.chats[index].resender
                                                        .name ??
                                                    "",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                            Text(
                                              state.chats[index].userStatus
                                                  ? 'Online'
                                                  : 'Offline'.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: state
                                                        .chats[index].userStatus
                                                    ? Style.greenColor
                                                    : Style.primaryColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                  100.verticalSpace
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
