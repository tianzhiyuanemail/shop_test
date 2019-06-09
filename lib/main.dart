import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_test/pages/index_page.dart';
import 'package:provide/provide.dart';
import 'package:shop_test/provide/conters.dart';


void main(){
  var counter = Conter();

  var providers = Providers();
  providers..provide(Provider<Conter>.value(counter));
  runApp(ProviderNode(child: MyApp(),providers: providers,));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Container(
      child: MaterialApp(
        title: '百姓生活家',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: new IndexPage(),
      ),
    );
  }
}

