import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class likeButton extends StatefulWidget {
  const likeButton({super.key});

  @override
  State<likeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<likeButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LikeButton(
        size: 18,
      )),
    );
  }
}
