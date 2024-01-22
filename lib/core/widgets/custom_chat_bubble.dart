import 'package:chatify/core/models/message_model.dart';
import 'package:chatify/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

// ignore: must_be_immutable
class CustomChatBubble extends StatelessWidget {
  CustomChatBubble({super.key, required this.type, required this.model});
  BubbleType type;
  MessageModel model;
  @override
  Widget build(BuildContext context) {
    return CustmChatBubble(context, type, model);
  }

  Widget CustmChatBubble(
          BuildContext context, BubbleType type, MessageModel model) =>
      ChatBubble(
        clipper: ChatBubbleClipper9(type: type),
        alignment: type == BubbleType.sendBubble ? Alignment.topRight : null,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: type == BubbleType.sendBubble
            ? Color(0xfffDDFFEC)
            : Color(0xffF0F4F9),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            model.message,
            style: TextStyle(color: AppColors.black),
          ),
        ),
      );
}
