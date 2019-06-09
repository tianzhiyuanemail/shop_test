import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_test/config/service_method.dart';
import 'package:shop_test/modle/category.dart';



class CateGoryPage extends StatefulWidget {
  @override
  _CateGoryPageState createState() => _CateGoryPageState();
}

class _CateGoryPageState extends State<CateGoryPage> {

  List<CategoryBigModel> list = [];

  @override
  void initState() {
    _getCategory ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("类别"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategotyNav(),

          ],
        ),
      ),
    );
  }

  Widget LeftCategotyNav(){
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(width: 1,color: Colors.black12)
          )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index){
          return _leftInkwell(index);
        },
      ),
    );
  }

  Widget _leftInkwell(int  index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(20),
        padding: EdgeInsets.only(left: 20,top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: Text(list[index].tbkName,style: TextStyle(fontSize: ScreenUtil().setSp(26)),),
      ),
    );
  }

  void _getCategory () async {
    await getCatePage().then((val){
      List data = val['data'] as List;
      print(data);
      CategoryBigListModel listModel = CategoryBigListModel.formJson(data);

      setState(() {
        list = listModel.data;
      });
    });
  }
}
