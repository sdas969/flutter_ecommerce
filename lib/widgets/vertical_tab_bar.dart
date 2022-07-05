import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';

class VerticalTabBar extends StatelessWidget {
  const VerticalTabBar({
    Key? key,
    required TabController tabBarController,
  })  : _tabBarController = tabBarController,
        super(key: key);

  final TabController _tabBarController;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 3,
        child: TabBar(
            unselectedLabelColor: appTextColor,
            labelColor: Colors.black,
            indicatorWeight: 10,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: appBarColor, width: 8.0),
                insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 50.0)),
            controller: _tabBarController,
            tabs: const [
              Tab(text: 'Benefits'),
              Tab(text: 'Reviews'),
              Tab(text: 'How to Use'),
              Tab(text: 'About')
            ]));
  }
}
