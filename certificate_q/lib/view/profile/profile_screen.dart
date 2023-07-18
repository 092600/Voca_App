import 'package:flutter/material.dart';

import '../../common/component/custom_app_bar.dart';
import '../../common/const/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  List<String> tmp = ["목표 설정하기", "CSV 파일로 단어 등록하기", "CSV 파일로 단어 내보내기"];

  @override
  Widget build(BuildContext context) {
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
                // top: 30,
                top: 20,
                bottom: 10,
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
              height: 170,
              child: Column(
                children: [
                  const UserProfileRow(
                    userId: "user20619559",
                    userEmail: "tyiju@naver.com",
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyPageButtom(
                        content: "슬롯 추가하기",
                      ),
                      MyPageButtom(
                        content: "슬롯 설정하기",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              tmp
                  .map(
                    (content) => MyPageFunctionalButton(
                      content: content,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPageFunctionalButton extends StatelessWidget {
  String content;

  MyPageFunctionalButton({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
