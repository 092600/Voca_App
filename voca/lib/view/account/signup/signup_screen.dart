import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voca/common/data/repository/auth_repository.dart';

import '../../../common/component/custom_app_bar.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/data/model/account/account.dart';
import 'component/email_text_field.dart';
import 'component/name_text_field.dart';
import 'component/password_text_field.dart';
import 'component/signup_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController password2Controller;

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String password2 = '';

  bool isChecked = false;
  // bool isAvailableId = false;

  bool isAvailableFirstName = false;
  bool isAvailableLastName = false;
  bool isConfirmedEmail = false;
  bool isAvailableEmail = false;
  bool isAvailablePassword = false;

  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
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
              useSettingsIcon: true,
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
                        height: 20,
                      ),
                      renderSignupHeaderText(),
                      const SizedBox(
                        height: 10,
                      ),
                      NameTextFields(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        firstNameOnChanged: (value) {
                          setState(() {
                            value.toString().isNotEmpty
                                ? isAvailableFirstName = true
                                : isAvailableFirstName = false;

                            firstName = value;
                          });
                        },
                        lastNameOnChanged: (value) {
                          setState(() {
                            value.toString().isNotEmpty
                                ? isAvailableLastName = true
                                : isAvailableLastName = false;

                            lastName = value;
                          });
                        },
                        isLoaded: true,
                        isAvailableFirstName: isAvailableFirstName,
                        isAvailableLastName: isAvailableLastName,
                      ),
                      EmailTextField(
                        emailController: emailController,
                        isLoaded: true,
                        isAvailableEmail: isAvailableEmail,
                        onTap: () async {
                          // 1. 이메일 형식일 때 중복확인 누른 경우
                          if (isAvailableEmail) {
                            // 중복 확인
                            bool result = await AuthRepository.dupulicateEmail(
                              email: email,
                            );

                            // 1. 같은 이메일이 존재할 경우
                            //    (result == true / isConfirmedEmail = false)
                            // 2. 존재하지 않는 경우
                            //    (result == false / isConfirmfalse = true)
                            !result
                                ? isConfirmedEmail = true
                                : isConfirmedEmail = false;

                            // TextFormField Border > red로 변경
                            setState(() {
                              !isConfirmedEmail
                                  ? isAvailableEmail = false
                                  : null;
                            });

                            // 해당 이메일 사용 중 알림 표시
                            if (result) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Center(
                                  child: Text('이미 사용 중인 이메일입니다.\n다시 시도해주세요'),
                                ),
                                duration: Duration(seconds: 1), //올라와있는 시간
                              ));
                            }
                          } else {
                            setState(() {
                              isAvailableEmail = false;
                            });
                          }
                        },
                        onChanged: (value) {
                          email = value;

                          if (Account.isEmailValid(value)) {
                            setState(() {
                              isAvailableEmail = true;
                            });
                          } else {
                            setState(() {
                              isAvailableEmail = false;
                            });
                          }
                          isConfirmedEmail = false;
                        },
                      ),
                      PasswordTextField(
                        passwordController: passwordController,
                        password2Controller: password2Controller,
                        isLoaded: true,
                        isAvailablePassword: isAvailablePassword,
                        onChanged: (value) {
                          if ((Account.isPasswordValid(value)) &&
                              (passwordController.text ==
                                  password2Controller.text)) {
                            setState(() {
                              isAvailablePassword = true;
                            });
                          } else {
                            setState(() {
                              isAvailablePassword = false;
                            });
                          }

                          password = passwordController.text;
                        },
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
                        height: 5,
                      ),
                      CustomConfirmButton(
                        content: "Next",
                        onTap: () {
                          if (isAvailableFirstName &&
                              isAvailableLastName &&
                              isConfirmedEmail &&
                              isAvailablePassword &&
                              isChecked) {
                            Account account = Account(
                              email: email,
                              firstName: firstName,
                              lastName: lastName,
                              // username: "$firstName $lastName",
                              password: password,
                            );

                            print(
                                "${account.email}, $firstName, $lastName, ${account.password}");

                            AuthRepository.registerAccount(account);
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SetUserInfoScreen()),
                            //   (route) => route == "/user/register",
                            // );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: SizedBox(
                                  height: 80,
                                  child: Center(
                                    child: Text('필수 입력 사항을 다시 한번 확인해주세요.'),
                                  ),
                                ),
                                duration: Duration(seconds: 1), //올라와있는 시간
                              ),
                            );
                          }
                        },
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
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "회원가입",
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "으로",
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
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
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "단어 공부",
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "를 즐겨보세요 !",
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
