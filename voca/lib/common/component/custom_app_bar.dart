import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/account/login/login_screen.dart';
import '../const/app_colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    this.expandedHeight,
    this.appBarBody,
    this.useSettingsIcon = false,
    this.bigFontSize = true,
    String? title,
  }) : title = title ?? "Exam Excercise";

  final Widget? appBarBody;
  final double? expandedHeight;

  final String title;
  final bool useSettingsIcon;
  final bool bigFontSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: widget.expandedHeight,
      pinned: true,
      actions: [
        const SizedBox(
          width: 10,
        ),
        widget.useSettingsIcon == false
            ? InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SettingBottomSheetButton(
                                    content: "로그아웃",
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                        (route) => route == "/home",
                                      );
                                    },
                                  ),
                                  SettingBottomSheetButton(
                                    content: "고객지원",
                                    onTap: () {
                                      print("고객지원");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: const Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Colors.white,
                ),
              )
            : Container(),
        const SizedBox(
          width: 10,
        ),
      ],
      centerTitle: false,
      backgroundColor: primaryColor,
      title: Text(
        widget.title,
        style: GoogleFonts.bebasNeue(
          fontSize: widget.bigFontSize ? 25 : 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      flexibleSpace: widget.appBarBody,
    );
  }
}

class SettingBottomSheetButton extends StatelessWidget {
  const SettingBottomSheetButton({
    required this.content,
    required this.onTap,
    super.key,
  });

  final String content;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 55,
          child: Center(
            child: Text(
              content,
              style: GoogleFonts.bebasNeue(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
