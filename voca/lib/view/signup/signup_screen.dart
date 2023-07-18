import 'package:voca/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../common/component/custom_app_bar.dart';
import '../../common/const/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController password2Controller;

  String email = '';
  String password = '';
  String password2 = '';

  bool isChecked = false;
  bool isAvailableId = false;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            const CustomAppBar(
              title: "회원가입",
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      renderSignupHeaderText(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomSignupFormField(
                              label: "Email",
                              isEmail: true,
                              hintText: "이메일",
                              controller: emailController,
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
                              onPressed: () {
                                setState(() {
                                  isAvailableId = true;
                                  print(isAvailableId);
                                });
                              },
                              child: const Text("중복확인"),
                            ),
                          ),
                        ],
                      ),
                      renderSignupSubText(
                        icon: const Icon(
                          Icons.verified_rounded,
                          size: 20,
                        ),
                        text: "6 ~ 12자 영문, 숫자로 입력해주세요.",
                        isLongText: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomSignupFormField(
                        label: "Password",
                        isEmail: false,
                        hintText: "비밀번호",
                        controller: passwordController,
                      ),
                      CustomSignupFormField(
                        label: "Password",
                        isEmail: false,
                        hintText: "비밀번호 재확인",
                        controller: password2Controller,
                      ),
                      renderSignupSubText(
                        icon: const Icon(
                          Icons.verified_rounded,
                          size: 20,
                        ),
                        text:
                            "비밀번호는 영문, 대소문자, 숫자, 특수문자(.!@#\$%)를 혼합하여 8~20자 이내로 입력해주세요",
                        isLongText: true,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: primaryColor,
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text("[필수] 전체 약관에 동의 합니다."),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (isAvailableId) {
                            email = emailController.text;
                            password = passwordController.text;
                            password2 = password2Controller.text;

                            if (password != password2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Center(
                                    child: Text(
                                        '비밀번호가 일치하지 않습니다.\n 수정 후 다시 한번 시도해주세요 '),
                                  ),
                                  duration: Duration(seconds: 1), //올라와있는 시간
                                ),
                              );
                            } else {
                              if (!isChecked) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Center(
                                    child: Text('필수 약관 동의를 해주세요'),
                                  ),
                                  duration: Duration(seconds: 1), //올라와있는 시간
                                ));
                              } else {
                                print(
                                    "email : $email, password : $password, password2 : $password2, isChecked : $isChecked");

                                showTopSnackBar(
                                  Overlay.of(context),
                                  CustomSnackBar.success(
                                    message: "회원가입되었습니다.",
                                    backgroundColor: primaryColor!,
                                  ),
                                );

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                  (route) => route == "/login",
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                  child: Text('아이디 중복확인을 해주세요'),
                                ),
                                duration: Duration(seconds: 1), //올라와있는 시간
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container renderSignupSubText(
      {required Icon icon, required String text, required isLongText}) {
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

  Column renderSignupHeaderText() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "간단한 ",
              style: GoogleFonts.bebasNeue(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "회원가입",
              style: GoogleFonts.bebasNeue(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "으로",
              style: GoogleFonts.bebasNeue(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "재미있는 ",
              style: GoogleFonts.bebasNeue(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "단어 공부",
              style: GoogleFonts.bebasNeue(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "를 즐겨보세요 !",
              style: GoogleFonts.bebasNeue(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomSignupFormField extends StatelessWidget {
  const CustomSignupFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.isEmail,
    required this.controller,
  });

  final String label;
  final bool isEmail;
  final String hintText;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: TextFormField(
          controller: controller,
          obscureText: isEmail ? false : true,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          // validator: (value) {
          //   print(value);
          //   return "";
          //   if (value == null || value.isEmpty) {
          //     // ScaffoldMessenger.of(context).showSnackBar(
          //     //   const SnackBar(content: Text('Processing Data')),
          //     // );
          //     return "";
          //   }

          //   return null;
          // },
          decoration: InputDecoration(
            hintText: hintText,
            // helperText: showHelperText ? helperText : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            // errorText: "",
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
      ),
    );
  }
}

Container OAuth2LoginBox(Color color, String imageName) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: SvgPicture.asset(
        "assets/svg/$imageName.svg",
        width: 40,
        height: 40,
      ),
    ),
  );
}
