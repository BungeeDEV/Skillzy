import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String title, String message, ContentType contentType) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,


      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}