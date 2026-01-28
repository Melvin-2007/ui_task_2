import 'package:task_6/models/message_model.dart';

class UserModel {
  String name;
  int unreadCount;
  List<MessageModel> messages;
  UserModel({required this.name, required this.messages, required this.unreadCount,});
}
