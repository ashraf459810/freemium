import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';

class FoundSomethingComment extends StatefulWidget {
  FoundSomethingComment({Key key}) : super(key: key);

  @override
  _FoundSomethingCommentState createState() => _FoundSomethingCommentState();
}

class _FoundSomethingCommentState extends State<FoundSomethingComment> {
  String comment;
  TextEditingController commentc = TextEditingController();

  

  ReusableWidgets reusableWidgets = ReusableWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableWidgets.appbar(context, "Lost Items"),
      body: SingleChildScrollView(
              child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.grey[200],
                height: 1,
              ),
              SizedBox(
                height: h(53),
              ),
              Row(
                children: [
                  SizedBox(
                    width: w(24),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Teady Bear",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.sp,
                            fontFamily: "SFPRO",
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: h(10),
                      ),
                      Text(
                        "12 Dec, 2020",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontFamily: "SFPRO",
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: h(10),
                      ),
                      Text(
                        "By Hasan",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: "SFPRO",
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: w(107),
                  ),
                  Column(
                    children: [
                      Container(
                        height: h(121),
                        width: w(130),
                        // decoration:
                        //  BoxDecoration(
                        //    boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey[200].withOpacity(0.5),
                        //     spreadRadius: 1,
                        //     blurRadius: 1,
                        //     offset: Offset(
                        //         1, 1), // changes position of shadow
                        //   )
                        // ]
                        // ),
                        child: Image.asset(
                          "assets/images/Rectangle 92.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: h(21),
              ),
              Container(
                width: w(328),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "My son lost his favorite teddy bear. It is brown and small. If you findit please take it to lost and found office. Thank you.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontFamily: "SFPRO",
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h(14.5),
              ),
              Container(
                height: 1,
                width: w(350),
                color: Colors.grey[300],
              ),
              SizedBox(height: h(25)),
              typingContainer(commentc, comment),
             SizedBox(height: h(29),),


             Container(height: h(300),
                          child: ListView.builder(
                 itemCount: 8,
                 itemBuilder: (context, index) => 
                             Container(
                              child: Column(
                     children: [
                       Row(children: [
                         SizedBox(width: w(25),),
                         Text("Ahmad",style: TextStyle(color: Colors.black87,fontSize: 20.sp,fontFamily: "SFPRO"),),
                         SizedBox(width: w(190),),

Text("21 Jan, 10:45 AM",style: TextStyle(color: Colors.black87,fontSize: 12.sp,fontFamily: "SFPRO"),),

                       ],),
                       SizedBox(height: h(7),),

                           Container(
            height:  ScreenUtil().setHeight(47),
            width: ScreenUtil().setWidth(327),
            decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColor.container,
                        
            ),
            child: Center(child: Row(
                        children: [
                          SizedBox(width: w(7),),
                          Flexible(child: Text("I think I saw this on floor 15 in building B4.",style: TextStyle(color: Colors.black87,fontSize: 12.sp),)),
                        ],
            ),),
            ),
            SizedBox(height: h(20),)
                     ],
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

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}

Widget typingContainer(
    TextEditingController textEditingController, String inputtext) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: ScreenUtil().setWidth(25.1),
          ),
          Text(
            " ",
            style: TextStyle(
                color: AppColor.hintcolor,
                fontSize: 16.sp,
                fontFamily: 'SFPRO'),
          ),
        ],
      ),
      SizedBox(
        height: ScreenUtil().setHeight(12),
      ),
      Container(
        height: ScreenUtil().setHeight(47),
        width: ScreenUtil().setWidth(327),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColor.container,
        ),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "Add Comment",

                  // contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(115),top: h(15)),
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                onChanged: (value) => inputtext = value,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
