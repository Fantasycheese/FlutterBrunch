import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/const.dart';

import 'component/introduction_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _key = GlobalKey<ScaffoldState>();
  double _introOpacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: Container(
          color: Colors.brown,
          child: ListView(
            children: [
              Container(
                color: AppColor.pink,
                padding: EdgeInsets.all(8),
                child: Text(
                  Wording.homePageName,
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 32,
                  ),
                ),
                height: 100,
              ),
              ListTile(
                leading: Icon(Icons.flag),
                title: Text(Wording.challenges),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(Wording.homePageName),
      ),
      backgroundColor: Colors.brown,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: _introOpacity,
                  child: IntroductionWidget(),
                ),
                onTap: () {
                  setState(() {
                    _introOpacity = _introOpacity == 0 ? 1 : 0;
                  });
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Challenges',
                    style: TextStyle(color: Colors.cyanAccent, fontSize: 18),
                  ),
                ),
              ),
              //  https://flutter.dev/docs/cookbook/design/drawer
              GestureDetector(
                onTap: () {
                  _key.currentState.openDrawer();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      'Flutter Brunch 2020/08 '
                      '\n 1. Widget 練習：Drawer'
                      '\n 2. 動畫練習：幫 App 介紹區塊加上動畫效果'
                      '\n 3. 點擊開啟 Drawer',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
