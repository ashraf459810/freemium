import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicy extends StatefulWidget {
  PrivacyPolicy({Key key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String data;
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                data ?? "",
                style: TextStyle(
                    color: Colors.black, fontSize: 16.sp, fontFamily: "SFPRO"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loadData() async {
    final _loadedData = await rootBundle.loadString('assets/privacy.txt');
    setState(() {
      data = _loadedData;
    });
  }
}
