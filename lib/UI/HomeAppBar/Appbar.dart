import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class HomeAppBar extends StatefulWidget {
  HomeAppBar({Key key}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        leading:IconButton(
              icon: Icon(
                Icons.menu,
                size: 40.sp,
              ),
              onPressed: () {
                print("here");
                Scaffold.of(context).openDrawer();
              }),
        
        iconTheme: IconThemeData(color: Colors.black87),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: w(12)),
            child: GestureDetector( onTap: (){

                  Scaffold.of(context).openEndDrawer();

            },
              child: SvgPicture.asset("assets/images/bellicon.svg",width: w(30),height: h(30),),),
          ),
        ],
      ),
    );
  }
}
double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
