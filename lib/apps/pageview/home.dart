import 'package:flutter/material.dart';
import 'package:flutter_sbx/apps/pageview/page1.dart';
import 'package:flutter_sbx/apps/pageview/page2.dart';

class PageViewApp extends StatefulWidget {
  const PageViewApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageViewApp();
  }
}

class _PageViewApp extends State<PageViewApp> {
  late PageController _pageController;
  int _selectIdx = 0;

  static const _pages = [Page1(), Page2()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectIdx);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int idx) {
    setState(() {
      _selectIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
