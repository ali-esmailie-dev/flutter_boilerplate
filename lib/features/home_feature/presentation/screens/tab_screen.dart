import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/widgets/app_scaffold.dart';
import 'package:personal_portfolio/core/widgets/general_appbar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: GeneralAppBar(
        title: 'Tab screen',
        bottom: TabBar(
          controller: tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.videocam_outlined),
              text: 'Video',
              iconMargin: EdgeInsets.only(),
            ),
            Tab(
              icon: Icon(Icons.photo_outlined),
              text: 'Photos',
              iconMargin: EdgeInsets.only(),
            ),
            Tab(
              icon: Icon(Icons.audiotrack_sharp),
              text: 'Audio',
              iconMargin: EdgeInsets.only(),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(
            child: Icon(Icons.videocam_outlined),
          ),
          Center(
            child: Icon(Icons.photo_outlined),
          ),
          Center(
            child: Icon(Icons.audiotrack_sharp),
          ),
        ],
      ),
    );
  }
}
