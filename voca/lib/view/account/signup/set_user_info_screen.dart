import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voca/common/const/app_colors.dart';
import 'package:voca/common/data/model/word/type/language_type.dart';

import '../../../common/component/custom_app_bar.dart';
import '../../../common/data/model/account/account.dart';
import 'component/signup_button.dart';

class SetUserInfoScreen extends StatefulWidget {
  const SetUserInfoScreen({super.key});

  @override
  State<SetUserInfoScreen> createState() => _SetUserInfoScreenState();
}

class _SetUserInfoScreenState extends State<SetUserInfoScreen> {
  Account account = Account(
    email: "tyiju@naver.com",
    firstName: "sim",
    lastName: "junghun",
    password: "",
  );

  List<LanguageType> selectedLanguagies = [];

  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);

      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);

    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(
            title: "회원 정보 설정",
            useSettingsIcon: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: primaryColor!,
                          ),
                        ),
                        height: 130,
                        width: 130,
                        child: SizedBox(
                          child: CircleAvatar(
                            backgroundColor: backgroundColor,
                            child: _image == null
                                ? SvgPicture.asset(
                                    "assets/svg/UserProfile.svg",
                                    width: 80,
                                  )
                                : ClipOval(
                                    child: SizedBox(
                                      height: 130,
                                      width: 130,
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet();
                        },
                        child: const SizedBox(
                          height: 140,
                          width: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.camera_alt_rounded,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 160,
              // color: Colors.blue,
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 8,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "공부 언어 설정 ",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "(최대 2개 설정 가능)",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: LanguageType.values.map(
                      (type) {
                        final int index = LanguageType.values.indexOf(type);
                        return LanguageSelectBox(
                          type: type,
                          onTap: () {
                            if (!selectedLanguagies.contains(type)) {
                              if (selectedLanguagies.length < 2) {
                                setState(() {
                                  selectedLanguagies.add(type);
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: SizedBox(
                                      height: 80,
                                      child: Center(
                                        child: Text('공부 언어는 최대 2개까지 설정 가능합니다.'),
                                      ),
                                    ),
                                    duration: Duration(seconds: 1), //올라와있는 시간
                                  ),
                                );
                              }
                            } else {
                              setState(() {
                                selectedLanguagies.remove(type);
                              });
                            }

                            print(selectedLanguagies.length);
                          },
                          isClicked: selectedLanguagies.contains(type),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomConfirmButton(
                content: "회원가입 완료하기",
                onTap: () {
                  print("OK");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImagePickerButton(
                onTap: () => _pickImage(ImageSource.camera),
                icons: Icons.camera_alt_rounded,
                content: "Use a Camera",
              ),
              SizedBox(
                child: Center(
                  child: Text(
                    "OR",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ImagePickerButton(
                onTap: () => _pickImage(ImageSource.gallery),
                icons: Icons.library_add,
                content: "Browse Gallery",
              ),
            ],
          ),
        );
      },
    );
  }
}

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    super.key,
    required this.onTap,
    required this.icons,
    required this.content,
  });

  final onTap;
  final IconData icons;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 7),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons,
              size: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              content,
              style: GoogleFonts.bebasNeue(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectBox extends StatelessWidget {
  const LanguageSelectBox({
    super.key,
    required this.type,
    required this.onTap,
    required this.isClicked,
  });

  final onTap;
  final LanguageType type;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 33,
        margin: const EdgeInsets.only(right: 6, bottom: 10),
        decoration: BoxDecoration(
          color: isClicked ? primaryColor : primaryColor!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            type.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class AccountInfoRow extends StatelessWidget {
  const AccountInfoRow({
    super.key,
    required this.label,
    required this.info,
  });

  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          info,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
