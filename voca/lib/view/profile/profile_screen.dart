import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:voca/common/providers/security_storage_provider.dart';

import '../../common/component/custom_app_bar.dart';
import '../../common/const/app_colors.dart';
import '../../common/const/default.dart';
import '../../common/data/model/account/account.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  List<String> tmp = ["목표 설정하기", "CSV 파일로 단어 등록하기", "CSV 파일로 단어 내보내기"];

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
            child: FutureBuilder(
              future: storageProvider.getAccount(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Account account = snapshot.data!;

                  return Container(
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
                          userId: account.firstName,
                          userEmail: account.email,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     MyPageButtom(
                        //       content: "슬롯 추가하기",
                        //     ),
                        //     MyPageButtom(
                        //       content: "슬롯 설정하기",
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  );
                }

                return Container();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: MyPageFunctionalButton(
              content: "목표 설정하기",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return FutureBuilder(
                      future: storageProvider.getCurrentSetVocaGoal(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final setGoal = snapshot.data!;
                          int goalIndex = VOCA_GOALS.indexOf(setGoal);

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
                                    scrollController:
                                        FixedExtentScrollController(
                                      initialItem: goalIndex,
                                    ),
                                    itemExtent: 45,
                                    onSelectedItemChanged: (idx) {
                                      goalIndex = idx;
                                    },
                                    children: VOCA_GOALS
                                        .map((goal) => Text(goal))
                                        .toList(),
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
                        }

                        return Container();
                      },
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
                print("CSV 파일로 단어 등록하기");
              },
            ),
          ),
          SliverToBoxAdapter(
            child: MyPageFunctionalButton(
              content: "CSV 파일로 단어 내보내기",
              onTap: () {
                print("CSV 파일로 단어 내보내기");
              },
            ),
          ),

          // SliverList(
          //     tmp
          //         .map(
          //           (content) => MyPageFunctionalButton(
          //             content: content,
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
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
  final String userEmail;
  final String userId;

  const UserProfileRow({
    required this.userEmail,
    required this.userId,
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
              userId,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              userEmail,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        )
      ],
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
