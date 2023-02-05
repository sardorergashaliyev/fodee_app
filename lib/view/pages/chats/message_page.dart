import 'package:flutter/material.dart';
import 'package:foode/controllers/chat_controller.dart';
import 'package:foode/model/user_model.dart';
import 'package:foode/view/style/style.dart';
import 'package:foode/view/widgets/cached_network_image.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:foode/view/widgets/custom_video.dart';
import 'package:foode/view/widgets/messege_item.dart';
import 'package:foode/view/widgets/on_unfocused.dart';
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
          title: Row(
            children: [
              widget.user.avatar == null
                  ? const SizedBox.shrink()
                  : ClipOval(
                      child: Image.network(
                        widget.user.avatar ?? "",
                        width: 62,
                        height: 62,
                        fit: BoxFit.cover,
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
                itemCount: state.isUploading
                    ? state.messages.length + 1
                    : state.messages.length,
                itemBuilder: (context, index) {
                  return (state.isUploading && (index == 0))
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.grey,
                          ),
                        )
                      : Align(
                          alignment: state
                                      .messages[
                                          state.isUploading ? index - 1 : index]
                                      .ownerId ==
                                  state.userId
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: state
                                      .messages[
                                          state.isUploading ? index - 1 : index]
                                      .type ==
                                  "text"
                              ? MessageItem(
                                  isOwner: state
                                          .messages[state.isUploading
                                              ? index - 1
                                              : index]
                                          .ownerId ==
                                      state.userId,
                                  onEdit: () {
                                    message.text = state
                                        .messages[state.isUploading
                                            ? index - 1
                                            : index]
                                        .title;
                                    FocusScope.of(context)
                                        .autofocus(messageNode);
                                    event.changeEditText(
                                        messId: state
                                            .messages[state.isUploading
                                                ? index - 1
                                                : index]
                                            .messId,
                                        time: state
                                            .messages[state.isUploading
                                                ? index - 1
                                                : index]
                                            .time,
                                        oldText: state
                                            .messages[state.isUploading
                                                ? index - 1
                                                : index]
                                            .title);
                                  },
                                  onDelete: () {
                                    event.deleteMessage(
                                        chatDocId: widget.docId,
                                        messDocId: state
                                            .messages[state.isUploading
                                                ? index - 1
                                                : index]
                                            .messId);
                                  },
                                  message: state.messages[
                                      state.isUploading ? index - 1 : index],
                                )
                              : state
                                          .messages[state.isUploading
                                              ? index - 1
                                              : index]
                                          .type ==
                                      "image"
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: CustomImageNetwork(
                                        image: state
                                            .messages[state.isUploading
                                                ? index - 1
                                                : index]
                                            .title,
                                        height: 100,
                                        width: 100,
                                        radius: 16,
                                      ),
                                    )
                                  : CustomVideo(
                                      videoUrl: state
                                          .messages[state.isUploading
                                              ? index - 1
                                              : index]
                                          .title,
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
            prefixIcon: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      event.getImageGallery(widget.docId);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Icon(Icons.image)),
                  ),
                  GestureDetector(
                    onTap: () {
                      event.getVideoGallery(widget.docId);
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 5),
                        child: const Icon(Icons.video_library)),
                  ),
                ],
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                state.editTime != null
                    ? event.editMessage(
                        chatDocId: widget.docId,
                        messDocId: state.editMessId,
                        newMessage: message.text,
                        time: state.editTime ?? DateTime.now())
                    : event.sendMessage(
                        title: message.text, docId: widget.docId, type: 'text');
                message.clear();
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(Icons.send),
            ),
            colorFill: Style.greyColor,
            colorBorder: Style.greyColor,
            radius: 100,
            controller: message,
            label: "",
            hintext: 'Message',
            onchange: (value) {},
            obscuringCharacter: '',
            suffixicon: null,
          ),
        ),
      ),
    );
  }
}
