import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/models/message_model.dart';
import 'package:task_6/widgets/app_back_button.dart';
import 'package:task_6/widgets/app_chat_text_field.dart';
import 'package:task_6/widgets/app_text_field.dart';
import 'package:task_6/widgets/custom_app_bar.dart';
import 'package:task_6/widgets/user_avatar.dart';
import 'package:task_6/widgets/chat_message_tile.dart';

class ChatDetailsView extends StatefulWidget {
  final String senderName;
  final String receiverName;
  final List<MessageModel> messages;
  final Function() onMessageSend;
  const ChatDetailsView({
    super.key,
    required this.senderName,
    required this.receiverName,
    required this.messages,
    required this.onMessageSend,
  });

  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  late TextEditingController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    controller = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.messages.length,
                    separatorBuilder: (context, _) => SizedBox(height: 24),
                    itemBuilder: (context, index) => ChatMessageTile(
                      messageModel: widget.messages[index],
                      name: widget.messages[index].isReceived ? widget.receiverName : widget.senderName,
                    ),
                  ),
                  SizedBox(height: 48),
                ],
              ),
            ),
            CustomAppBar(
              title: widget.receiverName,
              rightIcon: UserAvatar(size: 40),
              leftIcon: AppBackButton(),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final String? imagePath = await getImagePath();
                        final model = MessageModel(message: ["you sent a image"], isImage: true, imagePath: imagePath);
                        setState(() {
                          widget.messages.add(model);
                        });
                        scrollList(milliseconds: 300);
                        widget.onMessageSend();
                      },
                      child: SvgPicture.asset(
                        AppAssets.add,
                        colorFilter: ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: AppChatTextField(
                        controller: controller,
                        onTap: () {
                          final String msg = controller.text.trim();
                          setState(() {
                            widget.messages.add(MessageModel(message: [msg]));
                          });
                          scrollList(milliseconds: 250);
                          controller.clear();
                          widget.onMessageSend();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> getImagePath() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) return image.path;
  }

  void scrollList({required int milliseconds}) async {
    await Future.delayed(Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: milliseconds),
      curve: Curves.linear,
    );
  }
}
