import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/models/message_model.dart';

class ChatMessageTile extends StatelessWidget {
  final String name;
  final MessageModel messageModel;
  const ChatMessageTile({
    super.key,
    required this.name,
     required this.messageModel,
  });

  @override
  Widget build(BuildContext context) {
    if (messageModel.isImage) {
      return Align(
        alignment: Alignment.centerRight,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.file(
            File(messageModel.imagePath ?? ""),
            height: 300,
            width: 240,
            errorBuilder: (context, error, stackTrace) => Text("Image not found"),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      itemCount: messageModel.message.length,
      separatorBuilder: (context, index) => SizedBox(height: 4),
      itemBuilder: (context, index) {
        return Align(
          alignment: messageModel.isReceived ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: messageModel.isReceived ? AppColors.blue2 : AppColors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomLeft: messageModel.isReceived ? Radius.circular(0) : Radius.circular(20),
                bottomRight: messageModel.isReceived ? Radius.circular(20) : Radius.circular(0),
              ),
            ),
            child: Column(
              crossAxisAlignment: messageModel.isReceived ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                if (index == 0)
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: messageModel.isReceived ? AppColors.grey2 : AppColors.blue4,
                    ),
                  ),
                Text(
                  messageModel.message[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: messageModel.isReceived ? AppColors.black : AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
