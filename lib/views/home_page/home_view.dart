import 'package:flutter/material.dart';

import '../../../common/views/custom_text.dart';
import '../class_page/class_page.dart';
import '../term_pages/term_page.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(appBar: _appBarOptions(), body: _wholeBody()));
  }

  Widget _wholeBody() {
    return TabBarView(
      children: <Widget>[
        TermPage(),
        ClassPage()],
    );
  }

  AppBar _appBarOptions() {
    return AppBar(
      bottom: const TabBar(
          tabs: [
            Tab(child: CustomText(text: 'Terms', textSize: 20)),
            Tab(child: CustomText(text: 'Classes', textSize: 20)),
          ]),
    );
  }
}
