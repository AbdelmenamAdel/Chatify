import 'package:flutter/material.dart';

ShowSnackBarMassenger(BuildContext context, String meseage) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(meseage)));
}
