import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/data/repository/auth_repository.dart';
import '../../../layout/home_layout.dart';
import '../signup/component/oauth2_login_box.dart';
import '../signup/component/signup_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.android_outlined,
                    size: 100,
                  ),
                  Text(
                    "Welcome",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "I'm presure to visit my app, thank you",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    label: "Email",
                    isEmail: true,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    label: "Password",
                    isEmail: false,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomConfirmButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        email = emailController.text;
                        password = passwordController.text;

                        final response = await AuthRepository.login(
                          email: email,
                          password: password,
                        );

                        if (response) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeLayout()),
                            (route) => route == "/login",
                          );
                        } else {
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.success(
                              message: "아이디 또는 비밀번호가 일치하지 않습니다.",
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    content: "Sign In",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const RegisterTextRow(),
                  const SizedBox(
                    height: 20,
                  ),
                  const OAuth2LoginRow()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OAuth2LoginRow extends StatelessWidget {
  const OAuth2LoginRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OAuth2LoginBox(
          color: Colors.white,
          imageName: "Google_Logo",
        ),
        SizedBox(
          width: 15,
        ),
        OAuth2LoginBox(
          color: Colors.white,
          imageName: "Facebook_Logo",
        ),
      ],
    );
  }
}

class RegisterTextRow extends StatelessWidget {
  const RegisterTextRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not a Member ? ",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        InkWell(
          // onTap: () => Navigator.pushNamed(context, "/user/profile"),
          onTap: () => Navigator.pushNamed(context, "/user/register"),

          child: const Text(
            "Register Now",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.isEmail,
    required this.controller,
  });

  final String label;
  final bool isEmail;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: isEmail ? false : true,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "값을 입력해주세요.";
          }

          return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
