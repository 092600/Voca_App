import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/default.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.expandedHeight,
    this.appBarBody,
    String? title,
  }) : title = title ?? "Exam Excercise";

  final Widget? appBarBody;
  final double? expandedHeight;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      actions: const [
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.more_horiz,
          size: 30,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
      ],
      centerTitle: false,
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: GoogleFonts.bebasNeue(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
      flexibleSpace: appBarBody,
    );
  }
}
