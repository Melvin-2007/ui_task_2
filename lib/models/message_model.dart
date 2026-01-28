class MessageModel {
  bool isReceived;
  bool isImage;
  String? imagePath;
  List<String> message;
  MessageModel({required this.message, this.isReceived = false, this.isImage = false, this.imagePath});
}
