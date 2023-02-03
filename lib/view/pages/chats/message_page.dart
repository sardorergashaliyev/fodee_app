import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:foode/controllers/chat_controller.dart';
import 'package:foode/model/user_model.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/cached_network_image.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:foode/view/widgets/on_unfocused.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessagePage extends StatefulWidget {
  final String docId;
  final UserModel user;

  const MessagePage({Key? key, required this.docId, required this.user})
      : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController message = TextEditingController();
  final FocusNode messageNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatController>().getMessages(widget.docId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChatController>();
    final event = context.read<ChatController>();
    return OnUnFocusTap(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset(
                  'assets/image/arrow_back.png',
                ),
              ),
            ),
          ),
          title: Row(
            children: [
              widget.user.avatar == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomImageNetwork(
                        image: widget.user.avatar ?? "",
                        width: 45,
                        height: 45,
                      ),
                    ),
              Text(widget.user.name ?? ""),
            ],
          ),
        ),
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.all(24),
                reverse: true,
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  return FocusedMenuHolder(
                    blurSize: 10,
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {},
                    menuItems: state.messages[index].ownerId == state.userId
                        ? [
                            FocusedMenuItem(
                                title: const Text("Edit"),
                                onPressed: () {
                                  message.text = state.messages[index].title;
                                  FocusScope.of(context).autofocus(messageNode);
                                  event.changeEditText(
                                      messId: state.messages[index].messId,
                                      time: state.messages[index].time,
                                      oldText: state.messages[index].title);
                                }),
                            FocusedMenuItem(
                                title: const Text("Delete"),
                                onPressed: () {
                                  event.deleteMessage(
                                      chatDocId: widget.docId,
                                      messDocId: state.messages[index].messId);
                                }),
                          ]
                        : [
                            FocusedMenuItem(
                                title: const Text("Delete"),
                                onPressed: () {
                                  event.deleteMessage(
                                      chatDocId: widget.docId,
                                      messDocId: state.messages[index].messId);
                                }),
                          ],
                    child: Align(
                      alignment: state.messages[index].ownerId == state.userId
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: state.messages[index].ownerId == state.userId
                              ? Style.primaryColor
                              : Style.greyColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: state.messages[index].title.length >= 50
                                  ? 50
                                  : null,
                              child: Text(
                                state.messages[index].title,
                                style: TextStyle(
                                    color: state.messages[index].ownerId ==
                                            state.userId
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 4),
                              child: Text(
                                DateFormat("hh:mm")
                                    .format(state.messages[index].time),
                                style: TextStyle(
                                    color: state.messages[index].ownerId ==
                                            state.userId
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
        bottomNavigationBar: Container(
          padding:
              const EdgeInsets.only(bottom: 12, left: 24, right: 24, top: 12),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: Colors.white,
          child: CustomTextFrom(
            
            colorFill: const Color.fromARGB(255, 223, 224, 226),
            radius: 24,
            node: messageNode,
            controller: message,
            label: "",
            suffixIcon: IconButton(
              onPressed: () {
                state.editTime != null
                    ? event.editMessage(
                        chatDocId: widget.docId,
                        messDocId: state.editMessId,
                        newMessage: message.text,
                        time: state.editTime ?? DateTime.now())
                    : event.sendMessage(message.text, widget.docId);
                message.clear();
                FocusScope.of(context).unfocus();
              },
              icon: Icon(Icons.send,
                  color: message.text.isNotEmpty ? Colors.blue : Colors.black),
            ),
            hintext: '',
            onChange: (s) {},
            onchange: (value) {},
          ),
        ),
      ),
    );
  }
}
