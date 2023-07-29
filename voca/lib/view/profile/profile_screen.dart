import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:voca/common/data/model/account/account_status.dart';
import 'package:voca/common/providers/security_storage_provider.dart';

import '../../common/component/custom_app_bar.dart';
import '../../common/const/app_colors.dart';
import '../../common/const/default.dart';
import '../../common/data/model/account/account.dart';
import 'inner_screen/profile_csv_layout_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> tmp = ["목표 설정하기", "CSV 파일로 단어 등록하기", "CSV 파일로 단어 내보내기"];
  late Account account = Account(
    email: "",
    firstName: "",
    lastName: "",
    status: AccountStatus.ACTIVE,
    password: "",
  );
  late String? currentVocalGoal;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final storageProvider =
          Provider.of<SecurityStorageProvider>(context, listen: false);

      account = await storageProvider.getAccount();
      currentVocalGoal = await storageProvider.getCurrentSetVocaGoal();

      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storageProvider = Provider.of<SecurityStorageProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const CustomAppBar(
            title: "My Page",
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                top: 40,
                // top: 20,
                bottom: 15,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 6,
                    color: primaryColor!,
                  ),
                ),
              ),
              child: Column(
                children: [
                  UserProfileRow(
                    account: account,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: MyPageFunctionalButton(
              content: "목표 설정하기",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    int goalIndex = VOCA_GOALS.indexOf(currentVocalGoal!);

                    return SizedBox(
                      child: AlertDialog(
                        content: Text(
                          "목표를 설정해주세요",
                          style: Theme.of(context).textTheme.displaySmall,
                          // style: TextStyle(
                          //   fontSize: 20,
                          // ),
                        ),
                        actions: [
                          SizedBox(
                            height: 120,
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                initialItem: goalIndex,
                              ),
                              itemExtent: 45,
                              onSelectedItemChanged: (idx) {
                                goalIndex = idx;
                              },
                              children:
                                  VOCA_GOALS.map((goal) => Text(goal)).toList(),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () {
                              storageProvider.setVocaGoal(
                                goal: VOCA_GOALS[goalIndex],
                              );
                              Navigator.pop(context);
                            },
                            child: Text(
                              "설정하기",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: MyPageFunctionalButton(
              content: "CSV 파일로 단어 등록하기",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileCsvLayoutPage(),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: MyPageFunctionalButton(
              content: "CSV 파일로 단어 내보내기",
              onTap: () {
                print("CSV 파일로 단어 내보내기");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileCsvLayoutPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyPageFunctionalButton extends StatelessWidget {
  String content;
  final onTap;

  MyPageFunctionalButton({
    required this.content,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        height: 60,
        // color: Colors.amber,
        child: Row(
          children: [
            Expanded(
              child: Text(
                content,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 17,
                    ),
              ),
            ),
            Container(
              child: const Icon(
                Icons.arrow_right_alt_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserProfileRow extends StatelessWidget {
  final Account account;

  const UserProfileRow({
    required this.account,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              account.getFullName(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              account.email,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Row(
              children: [
                ...account.languagies
                    .map((language) => LanguageContainer(
                          language: language.name,
                        ))
                    .toList(),
              ],
            )
          ],
        )
      ],
    );
  }
}

class LanguageContainer extends StatelessWidget {
  const LanguageContainer({
    super.key,
    required this.language,
  });

  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 24,
      decoration: BoxDecoration(
        color: primaryColor!.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 3, right: 5),
      child: Center(
        child: Text(
          language,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class MyPageButtom extends StatelessWidget {
  String content;
  Color? backgroundColor;

  MyPageButtom({
    required this.content,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 30,
        ),
        backgroundColor: backgroundColor ?? primaryColor,
        textStyle: Theme.of(context).textTheme.displaySmall,
      ),
      onPressed: () {},
      child: Text(content),
    );
  }
}
