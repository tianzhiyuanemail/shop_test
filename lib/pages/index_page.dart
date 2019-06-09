import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_test/pages/cate_page.dart';
import 'package:shop_test/pages/category_page.dart';
import 'package:shop_test/pages/home_page.dart';
import 'package:shop_test/pages/member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text("分类"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text("会员中心"),
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CateGoryPage(),
    CatePage(),
    MemberPage()
  ];

  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance  = ScreenUtil(width: 750,height: 1334)..init(context);

    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(244, 245, 245, 1),
//        appBar: AppBar(title: Text("eeeee"),),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body:
        IndexedStack(
          index: currentIndex,
          children: tabBodies,
        ),
      ),
    );
  }
}
