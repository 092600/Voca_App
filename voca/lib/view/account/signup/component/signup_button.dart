import 'package:flutter/material.dart';

import '../../../../common/const/app_colors.dart';

class CustomConfirmButton extends StatelessWidget {
  const CustomConfirmButton(
      {super.key, required this.onTap, required this.content});

  final onTap;
  final String content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
