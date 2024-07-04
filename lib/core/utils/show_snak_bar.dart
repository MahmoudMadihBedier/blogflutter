import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnakBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
    SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 6),
  )
  );
}