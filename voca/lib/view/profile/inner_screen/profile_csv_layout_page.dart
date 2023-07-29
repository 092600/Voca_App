import 'package:flutter/material.dart';
import 'package:voca/common/component/custom_app_bar.dart';
import 'package:voca/common/const/app_colors.dart';
import 'package:voca/view/profile/inner_screen/csv_export_page.dart';
import 'package:voca/view/profile/inner_screen/csv_import_page.dart';

class ProfileCsvLayoutPage extends StatefulWidget {
  const ProfileCsvLayoutPage({super.key});

  @override
  State<ProfileCsvLayoutPage> createState() => _ProfileCsvLayoutPageState();
}

class _ProfileCsvLayoutPageState extends State<ProfileCsvLayoutPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  late final List<Widget> csv_screens;

  int index = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    csv_screens = [
      const CsvImportPage(),
      const CsvExportPage(),
    ];

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            CustomAppBar(
              title: "USE CSV",
              appBarBody: ProfileCsvPageAppBarBody(
                tabController: tabController,
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
              ),
              expandedHeight: 120,
            ),
            SliverToBoxAdapter(
              child: csv_screens[index],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCsvPageAppBarBody extends StatelessWidget {
  const ProfileCsvPageAppBarBody({
    required this.tabController,
    required this.onTap,
    super.key,
  });

  final TabController tabController;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: SafeArea(
        child: Container(
            margin: const EdgeInsets.only(top: kTextTabBarHeight),
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: TabBar(
              controller: tabController,
              onTap: onTap,
              indicatorWeight: 4,
              indicatorColor: appBarBackgroundColor,
              tabs: const [
                Text("CSV 파일로\n단어 등록하기"),
                Text("CSV 파일로\n단어 내보내기"),
              ],
            )),
      ),
    );
  }
}
