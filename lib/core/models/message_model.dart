// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chatify/core/utils/strings.dart';

class MessageModel {
  final String message;
  final String id;
  MessageModel(this.message, this.id);

  factory MessageModel.fromjson(jsonData) {
    return MessageModel(jsonData[AppStrings.message], jsonData['id']);
  }
}
