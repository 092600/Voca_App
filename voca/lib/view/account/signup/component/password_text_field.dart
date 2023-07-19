import 'package:flutter/material.dart';
import 'package:voca/view/account/signup/component/signup_sub_text.dart';

import 'custom_signup_form_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.password2Controller,
    required this.onChanged,
    required this.isAvailablePassword,
    required this.isLoaded,
  });

  final TextEditingController passwordController;
  final TextEditingController password2Controller;

  final onChanged;

  final bool isAvailablePassword;
  final bool isLoaded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 3),
          height: 30,
          child: Row(children: [
            Text(
              "Password [required]",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ]),
        ),
        CustomSignupFormField(
          label: "Password",
          useObsecureText: false,
          hintText: "Password",
          controller: passwordController,
          onChanged: onChanged,
          isLoaded: isLoaded,
          isAvailable: isAvailablePassword,
        ),
        CustomSignupFormField(
          label: "Password",
          useObsecureText: false,
          hintText: "Password2",
          controller: password2Controller,
          onChanged: onChanged,
          isLoaded: isLoaded,
          isAvailable: isAvailablePassword,
        ),
        const SizedBox(
          height: 3,
        ),
        const SignupSubText(
          icon: Icon(
            Icons.verified_rounded,
            size: 20,
          ),
          text: "비밀번호는 영문, 대소문자, 숫자, 특수문자(.!@#\$%)를 혼합하여 8~20자 이내로 입력해주세요",
          isLongText: true,
        ),
      ],
    );
  }
}
