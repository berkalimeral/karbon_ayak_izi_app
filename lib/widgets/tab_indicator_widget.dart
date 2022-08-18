import 'package:flutter/material.dart';

import '../model/slider_model.dart';

class TabIndicator extends StatefulWidget {
  final int selectedIndex;
  const TabIndicator({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<TabIndicator> createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex,
          curve: Curves.linear, duration: const Duration(milliseconds: 400));
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: OnBoardModel.slides.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
    );
  }
}
