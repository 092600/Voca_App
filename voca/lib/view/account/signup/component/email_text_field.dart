import 'package:flutter/material.dart';
import 'package:voca/view/account/signup/component/signup_sub_text.dart';

import '../../../../common/const/app_colors.dart';
import 'custom_signup_form_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
    required this.onTap,
    required this.onChanged,
    required this.isAvailableEmail,
    required this.isLoaded,
  });

  final TextEditingController emailController;

  final onTap;
  final onChanged;

  final bool isAvailableEmail;
  final bool isLoaded;

  // final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 3),
          height: 30,
          child: Row(children: [
            Text(
              "Email [required]",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ]),
        ),
        Row(
          children: [
            Expanded(
              child: CustomSignupFormField(
                label: "Email",
                useObsecureText: true,
                hintText: "Email",
                controller: emailController,
                onChanged: onChanged,
                isAvailable: isAvailableEmail,
                isLoaded: isLoaded,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: 82,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: onTap,
                child: const Text("중복확인"),
              ),
            ),
          ],
        ),
        const SignupSubText(
          icon: Icon(
            Icons.verified_rounded,
            size: 20,
          ),
          text: "사용할 이메일을 입력해주세요.",
          isLongText: false,
        ),
      ],
    );
  }
}
