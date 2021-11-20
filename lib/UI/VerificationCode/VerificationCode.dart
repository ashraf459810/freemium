import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freemium/UI/CreateAccount/CreateAccount.dart';
import 'package:freemium/UI/Registeration/bloc/signup_bloc.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:toast/toast.dart';

class VerificationScreen extends StatefulWidget {
  final String number;
  VerificationScreen({Key key, this.number}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String currentcode;

  ReusableWidgets reusableWidgets = ReusableWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: reusableWidgets.appbar(context, "Verification")),
      body: Container(
        width: ScreenUtil().setWidth(375),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(30.6),
              ),
              Container(
                  height: ScreenUtil().setHeight(191.93),
                  width: ScreenUtil().setWidth(246.47),
                  child: SvgPicture.asset(
                    "assets/images/Group 25.svg",
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: ScreenUtil().setHeight(97),
              ),
              Text(
                "Enter the 4 digits code sent\n     to your phone number",
                style: TextStyle(color: AppColor.register, fontSize: 16.sp),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(46),
              ),
              Container(
                child: Builder(
                  builder: (context) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: PinFieldAutoFill(
                      codeLength: 4,
                      keyboardType: TextInputType.number,
                      decoration: UnderlineDecoration(
                        textStyle: TextStyle(fontSize: 20, color: Colors.black),
                        colorBuilder:
                            FixedColorBuilder(Colors.black.withOpacity(0.3)),
                      ),
                      currentCode: currentcode,
                      onCodeSubmitted: (code) {
                        context
                            .read<SignupBloc>()
                            .add(CodeCheckEvent(code, widget.number));
                      },
                      onCodeChanged: (code) async {
                        // context
                        //     .read<SignupBloc>()
                        //     .add(CodeCheckEvent(code, widget.number));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(41),
              ),
              Container(
                height: ScreenUtil().setHeight(19),
                width: ScreenUtil().setWidth(90),
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                      color: AppColor.button,
                      fontSize: 16.sp,
                      fontFamily: 'SFPRO'),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              GestureDetector(
                  onTap: () {},
                  child: BlocConsumer<SignupBloc, SignupState>(
                    listener: (context, state) {
                      if (state is CodeCheckState) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CreateAccount(),
                        ));
                      }

                      if (state is GetError) {
                        Toast.show(state.error, context,
                            duration: 2,
                            gravity: 100,
                            backgroundColor: AppColor.gradient2);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetLoading) {
                        return Center(child: CircularProgressIndicator());
                      }

                      return InkWell(
                        onTap: () {
                          if (currentcode != null) {
                            context.read<SignupBloc>().add(
                                CodeCheckEvent(currentcode, widget.number));
                          } else
                            Toast.show("please enter the code first", context,
                                duration: 2,
                                gravity: 100,
                                backgroundColor: AppColor.gradient2);
                        },
                        child: reusableWidgets.submitbutton(
                            "Verifiy", AppColor.button),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
