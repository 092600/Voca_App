import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupSubText extends StatelessWidget {
  const SignupSubText({
    super.key,
    required this.icon,
    required this.text,
    required this.isLongText,
  });

  final Icon icon;
  final String text;
  final bool isLongText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLongText ? 33 : 15,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              text: TextSpan(
                text: text,
                style: GoogleFonts.bebasNeue(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
