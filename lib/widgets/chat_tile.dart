import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/models/user_model.dart';
import 'package:task_6/views/chat_details_view.dart';
import 'package:task_6/widgets/user_avatar.dart';

class ChatTile extends StatelessWidget {
  final UserModel userModel;
  final Function() onMessageSend;
  const ChatTile({super.key, required this.userModel, required this.onMessageSend});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UserAvatar(),
        SizedBox(width: 8),
        Expanded(
          flex: 5,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailsView(
                  messages: userModel.messages,
                  receiverName: userModel.name,
                  senderName: "Brooke",
                  onMessageSend: onMessageSend,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.black),
                ),
                Text(
                  userModel.messages.last.message.last,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey2),
                ),
              ],
            ),
          ),
        ),
        userModel.unreadCount != 0
            ? Expanded(
                flex: 1,
                child: Container(
                  height: 24,
                  width: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.blue),
                  child: Text(
                    userModel.unreadCount.toString(),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
                  ),
                ),
              )
            : SizedBox(width: 16),
      ],
    );
  }
}
