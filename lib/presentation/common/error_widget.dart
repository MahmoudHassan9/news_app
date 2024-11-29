import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/result.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(
      {super.key, this.serverError, this.error, this.retryText, this.onCLick});

  final ServerError? serverError;
  final Error? error;
  final String? retryText;
  final VoidCallback? onCLick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            extractError(),
          ),
          SizedBox(
            height: 5.h,
          ),
          if (retryText != null)
            ElevatedButton(
              onPressed: () {
                onCLick?.call();
              },
              child: Text(
                retryText!,
              ),
            ),
        ],
      ),
    );
  }

  String extractError() {
    String message = 'Something went wrong';
    if (serverError?.message != null) {
      message = serverError!.message;
    } else if (error?.exception != null) {
      Exception ex = error!.exception;
      switch (ex) {
        case SocketException():
          message = 'No internet connection';
        case HttpException():
          message = "Couldn't find the post";
        case FormatException():
          message = 'Bad response format';
      }
    }
    return message;
  }
}
